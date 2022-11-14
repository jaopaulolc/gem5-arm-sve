#!/usr/bin/env bash

SCRIPTS_DIR=`dirname ${BASH_SOURCE}`
source $SCRIPTS_DIR/utils.sh

check_env_var GEM5_PATH

function usage {
    echo "usage: $0 -b <binary> [-l <SVE VL (default 4)>]"
    echo -e "\t[-a <arguments to binary as string>]"
    exit 1
}

while getopts "b:a:l:" o; do
    case "${o}" in
        b)
            binary=${OPTARG}
            ;;
        l)
            sve_vl=${OPTARG}
            ;;
        a)
            options=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

[[ -z "$binary" ]] && usage
[[ ! -e $binary ]] && echo "error: binary '$binary' does not exist" && exit
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
  --cmd $binary --options "$options"
