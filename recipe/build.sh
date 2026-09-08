#!/usr/bin/env bash

# pwd
# ls -alF

# compile Fortran source to get executables (*.x) and libedrixsfortran.a
# make -C src F90=mpif90 LIBS="-lopenblas -lparpack -larpack"

# copy standalone executables (*.x) to conda bin folder
# cp src/*.x $PREFIX/bin

# build Fortran extension via f2py
# $PYTHON setup.py build_ext --library-dirs=$LIBRARY_LIB

# TODO: Solve this rsh install properly with EPEL, probably have to update docker images
curl --output /tmp/rsh-0.17-102.el9.x86_64.rpm https://dl.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/r/rsh-0.17-102.el9.x86_64.rpm
sudo yum install /tmp/rsh-0.17-102.el9.x86_64.rpm -y

# install python parts
CONDA_PREFIX="${PREFIX}" "${PYTHON}" -m pip install . --no-deps --ignore-installed -vvv
