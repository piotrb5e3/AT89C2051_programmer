from setuptools import setup, find_packages

setup(
    name='at89overlord',
    version='0.2.1',
    description='Arduino-based AT89C2051 programmer',
    url='https://github.com/piotrb5e3/AT89C2051_programmer',
    author='Piotr Bakalarski',
    author_email='piotrb5e3@gmail.com',
    license='GNU General Public License v3.0',
    install_requires=[
        'intelhex',
        'pyserial',
        'termcolor',
    ],
    python_requires='>=3',
    packages=find_packages(),
    entry_points={
        'console_scripts': [
            'at89overlord = at89overlord.at89runner:main',
        ],
    },
)
