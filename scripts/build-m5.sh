#!/usr/bin/env bash

SCRIPTS_DIR=`dirname ${BASH_SOURCE}`
source $SCRIPTS_DIR/utils.sh

check_env_var GEM5_PATH
check_env_var M5_BUILD_PATH
check_env_var M5_LIB_PATH
check_env_var CROSS_COMPILER_PREFIX

cd $GEM5_PATH/util/m5
rm -rf build
$SCONS -j4 $M5_BUILD_PATH "arm64.CROSS_COMPILE=$CROSS_COMPILER_PREFIX-"
