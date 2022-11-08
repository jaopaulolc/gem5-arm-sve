#!/usr/bin/env bash

SCRIPTS_DIR=`dirname ${BASH_SOURCE}`
source $SCRIPTS_DIR/utils.sh

check_env_var GEM5_PATH

cd $GEM5_PATH
rm -rf build
$SCONS -j4 build/ARM/gem5.opt
