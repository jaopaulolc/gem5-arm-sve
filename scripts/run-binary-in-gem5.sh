#!/usr/bin/env bash

SCRIPTS_DIR=`dirname ${BASH_SOURCE}`
source $SCRIPTS_DIR/utils.sh

check_env_var GEM5_PATH

[[ $# < 1 ]] && \
  echo "usage: $0 <binary> [SVE VL (default 4)]" && exit 1

binary=$1
sve_vl=$2

[[ -z "$sve_vl" ]] && sve_vl=4

${GEM5_PATH}/build/ARM/gem5.opt \
  ${GEM5_PATH}/configs/example/se.py \
  --cpu-type MinorCPU \
  --mem-type SimpleMemory \
  --caches --l2cache \
  --l1i_size=64kB --l1i_assoc=4 \
  --l1d_size=64kB --l1d_assoc=4 \
  --l2_size=256kB --l2_assoc=4 \
  --mem-size=1GB \
  --cacheline_size=128 \
  --param "system.cpu[:].isa[:].sve_vl_se = ${sve_vl}" \
  --cmd $1 #--options 6000 
