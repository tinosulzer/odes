#!/bin/sh

SUNDIALS_DEFAULT_VERSION='3.1.1'
SUNDIALS_DEFAULT_PRECISION='double'
SUNDIALS_DEFAULT_INDEX_TYPE='int32_t'

export SUNDIALS_DIR=$HOME/sundials/"${SUNDIALS_VERSION:-$SUNDIALS_DEFAULT_VERSION}"/"${SUNDIALS_PRECISION:-$SUNDIALS_DEFAULT_PRECISION}"/"${SUNDIALS_INDEX_TYPE:-$SUNDIALS_DEFAULT_INDEX_TYPE}"
SUNDIALS_LIBDIR=$SUNDIALS_DIR/lib
SUNDIALS_INCLUDEDIR=$SUNDIALS_DIR/include

if [ ! -d "$SUNDIALS_LIBDIR" ]; then
    mkdir -p $SUNDIALS_DIR
    echo "Installing sundials ${SUNDIALS_VERSION:-$SUNDIALS_DEFAULT_VERSION}"
    ./ci_support/install_sundials.sh
else
    echo "Using cached sundials"
fi

export LD_LIBRARY_PATH=$SUNDIALS_LIBDIR:$LD_LIBRARY_PATH
export LIBRARY_PATH=$SUNDIALS_LIBDIR:$LIBRARY_PATH
export CPATH=$SUNDIALS_INCLUDEDIR:$CPATH