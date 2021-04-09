#!/bin/bash

CDIR="$(cd "$(dirname "$0")" ; pwd -P)"
XDIR="$CDIR/.."
PTDIR="$XDIR/.."
if [ -z "$PT_INC_DIR" ]; then
  PT_INC_DIR="$PTDIR/build/aten/src/ATen"
fi

#echo "$PTDIR/build/aten/src/ATen/RegistrationDeclarations.h"
#python "$CDIR/gen.py" \
  #--gen_class_mode \
  #--output_folder="$XDIR/torch_xla/csrc" \
  #"$XDIR/torch_xla/csrc/aten_xla_type.h" \
  #"$PTDIR/build/aten/src/ATen/RegistrationDeclarations.h" \
  #"$PT_INC_DIR/Functions.h" \

python "$PTDIR/tools/codegen/gen_backend_stubs.py" \
  --backend="XLA" \
  --pytorch_root="$PTDIR" \
  --output_dir="$XDIR/torch_xla/csrc" \
  --source_yaml="xla_native_functions.yaml"\
