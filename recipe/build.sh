#!/usr/bin/env bash

# pwd
# ls -alF
# 
# # compile Fortran source to get executables (*.x) and libedrixsfortran.a
# make -C src F90=mpif90 LIBS="-lopenblas -lparpack -larpack"
# 
# # copy standalone executables (*.x) to conda bin folder
# cp src/*.x $PREFIX/bin
# 
# # build Fortran extension via f2py
# $PYTHON setup.py build_ext --library-dirs=$LIBRARY_LIB

# This may fix the issue with not found Python3 executable on OSX (per https://stackoverflow.com/a/68916794):
export CMAKE_PREFIX_PATH=$(dirname $(dirname $PYTHON))

# install python parts
$PYTHON -m pip install . --no-deps --ignore-installed -vvv
