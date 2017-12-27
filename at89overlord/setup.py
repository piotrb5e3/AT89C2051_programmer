from setuptools import setup, find_packages

setup(
    name='at89overlord',
    version='0.2.2',
    description='Arduino-based AT89C2051 programmer',
    url='https://github.com/piotrb5e3/AT89C2051_programmer',
    author='Piotr Bakalarski',
    author_email='piotrb5e3@gmail.com',
    license='GNU General Public License v3 (GPLv3)',
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
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'Intended Audience :: Education',
        'Topic :: Software Development :: Embedded Systems',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Environment :: Console',
        'Operating System :: MacOS :: MacOS X',
        'Operating System :: Microsoft :: Windows',
        'Operating System :: POSIX',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.2',
        'Programming Language :: Python :: 3.3',
        'Programming Language :: Python :: 3.4',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
    ],
)
