/*
 * For AT89C2051 programming
 * 
 */
#include <stdint.h>

#define RST_PIN A0
#define EN_12V_PIN A1
#define P32_PIN A3
#define P33_PIN A4
#define P34_PIN A5
#define P35_PIN 2
#define P37_PIN 3
#define XTAL1_PIN A2

#define CMD_ERASE 'X'
#define CMD_READ_FULL 'R'
#define CMD_WRITE_FULL 'W'
#define CMD_READ_SIGNATURE 'S'

uint8_t hex2int(char c) {
  if(c >= '0' && c<= '9') {
    return c - '0';
  } else if(c >= 'a' && c<= 'f') {
    return c - 'a' + 10;
  } else if(c >= 'A' && c<= 'F') {
    return c - 'A' + 10;
  } else return 0;
}

uint8_t serial_get_byte() {
  uint8_t ret = 0;
  while(!Serial.available());
  ret = 16*hex2int(Serial.read());
  while(!Serial.available());
  ret += hex2int(Serial.read());
  return ret;
}

void serial_write_byte(uint8_t b) {
  char str[3];
  sprintf(str, "%.2X\0", b);
  Serial.print(str);
}

uint8_t paralel_pins[] = {
  4, //P1.0
  5,
  6,
  7,
  8,
  9,
  10,
  11, //P1.7
};

void on12() {
  digitalWrite(EN_12V_PIN, HIGH);
}
void off12() {
  digitalWrite(EN_12V_PIN, LOW);
}

uint8_t read_byte() {
  for(uint8_t i = 0; i<8; i++)
    pinMode(paralel_pins[i], INPUT);
  uint8_t r = 0;
  for(uint8_t i = 0; i<8; i++)
    r |= digitalRead(paralel_pins[i]) << i;
  return r;
}

void put_byte(uint8_t dt) {
  for(uint8_t i = 0; i<8; i++)
    pinMode(paralel_pins[i], OUTPUT);
  for(uint8_t i = 0; i<8; i++)
    digitalWrite(paralel_pins[i],dt & (1 << i));
}

void advance_counter() {
  digitalWrite(XTAL1_PIN, HIGH);
  delayMicroseconds(1);
  digitalWrite(XTAL1_PIN, LOW);
}

void init_prog() {
  digitalWrite(XTAL1_PIN, LOW);
  digitalWrite(RST_PIN, LOW);
  delay(1);
  digitalWrite(RST_PIN, HIGH);
  digitalWrite(P32_PIN, HIGH);
  delay(1);
}

void read_signature() {
  init_prog();
  digitalWrite(P33_PIN, LOW);
  digitalWrite(P34_PIN, LOW);
  digitalWrite(P35_PIN, LOW);
  digitalWrite(P37_PIN, LOW);  
  delay(1);
  serial_write_byte(read_byte());
  advance_counter();
  serial_write_byte(read_byte());
  advance_counter();
  Serial.write('$');
}

void chip_erase() {
  init_prog();
  digitalWrite(P33_PIN, HIGH);
  digitalWrite(P34_PIN, LOW);
  digitalWrite(P35_PIN, LOW);
  digitalWrite(P37_PIN, LOW);
  digitalWrite(EN_12V_PIN, HIGH);
  delay(1);
  digitalWrite(P32_PIN, LOW);
  delay(12);
  digitalWrite(EN_12V_PIN, LOW);
  digitalWrite(P32_PIN, HIGH);
  Serial.write('$');
}

void read_flash(int count) {
  init_prog();
  digitalWrite(P33_PIN, LOW);
  digitalWrite(P34_PIN, LOW);
  digitalWrite(P35_PIN, HIGH);
  digitalWrite(P37_PIN, HIGH);
  for(int i = 0; i < count; i++) {
    delay(1);
    serial_write_byte(read_byte());
    advance_counter();
  }
}

void chip_read() {
  uint8_t hi = serial_get_byte();
  uint8_t lo = serial_get_byte();
  uint16_t count = hi * 256 + lo;
  Serial.print("$");
  read_flash(count); 
  Serial.print("$");
}

uint8_t write_next(uint8_t dat) {
  uint8_t resp = 0;
  //Set mode to write
  digitalWrite(P33_PIN, LOW);
  digitalWrite(P34_PIN, HIGH);
  digitalWrite(P35_PIN, HIGH);
  digitalWrite(P37_PIN, HIGH);
  delay(1);
  
  //Set byte
  put_byte(dat);
  //HVprog_enable
  on12();
  delayMicroseconds(1500);
  //Pulse to start write
  digitalWrite(P32_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(P32_PIN, HIGH);
  delayMicroseconds(15);
  //HVprog_disable
  off12();
  delay(3);
  //Set mode to read
  digitalWrite(P34_PIN, LOW);
  delayMicroseconds(2);
  resp = read_byte();
  if(resp != dat) {
    return 0;
  }
  delayMicroseconds(10);
  advance_counter();
  return 1;
}

void setup() {
  Serial.begin(9600);
  pinMode(RST_PIN, OUTPUT);
  pinMode(EN_12V_PIN, OUTPUT);
  pinMode(P32_PIN, OUTPUT);
  pinMode(P33_PIN, OUTPUT);
  pinMode(P34_PIN, OUTPUT);
  pinMode(P35_PIN, OUTPUT);
  pinMode(P37_PIN, OUTPUT);
  pinMode(XTAL1_PIN, OUTPUT);

  for(uint8_t i = 0; i<8; i++)
    pinMode(paralel_pins[i], INPUT);

  digitalWrite(RST_PIN, LOW);
  digitalWrite(EN_12V_PIN, LOW);
  digitalWrite(P32_PIN, LOW);
  digitalWrite(P33_PIN, LOW);
  digitalWrite(P34_PIN, LOW);
  digitalWrite(P35_PIN, LOW);
  digitalWrite(P37_PIN, LOW);
  digitalWrite(XTAL1_PIN, LOW);

  Serial.println("Device ready");
  Serial.print("$");
}

void chip_write() {
  uint16_t chunksize = 256;
  uint8_t data[256];
  uint8_t hi = serial_get_byte();
  uint8_t lo = serial_get_byte();
  uint16_t count = hi * 256 + lo;
  init_prog();
  delay(1);
  Serial.write('$');
  for(uint16_t i = 0; i<count;) {
    uint16_t ct = 0;
    for(;ct<chunksize && i<count; i++,ct++) {
      uint8_t tmp = serial_get_byte();
      data[ct] = tmp;
    }
    for(uint16_t j = 0; j<ct;j++) {
      if(!write_next(data[j])) {
        Serial.print("^");
        return;
      }
    }
    Serial.write('$');
    Serial.write(i);
    delay(1);
  }
  Serial.write('$');
}

void loop() {
  while(!Serial.available());

  switch(Serial.read()) {
    case CMD_ERASE:
    chip_erase();
    break;

    case CMD_READ_FULL:
    chip_read();
    break;

    case CMD_WRITE_FULL:
    chip_write();
    break;

    case CMD_READ_SIGNATURE:
    read_signature();
    break;
    
    default:
    Serial.println("Unknown cmd");
    Serial.print('^');
  }
}
