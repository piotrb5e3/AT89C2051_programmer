#!/usr/bin/env python
import os
import codecs
from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))


def read(*parts):
    with codecs.open(os.path.join(here, *parts), 'r') as fp:
        return fp.read()


setup(
    name='at89overlord',
    version='0.4.0',
    description='Arduino-based AT89C2051 programmer',
    long_description=read('README.md'),
    long_description_content_type='text/markdown',
    url='https://github.com/piotrb5e3/AT89C2051_programmer',
    author='Piotr Bakalarski',
    author_email='piotrb5e3@gmail.com',
    license='GPLv3',
    install_requires=[
        'intelhex',
        'pyserial',
        'termcolor',
    ],
    setup_requires=['pytest-flake8', 'pytest-runner'],
    tests_require=['pytest', 'flake8'],
    python_requires='>=3.5',
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
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
    ],
)
