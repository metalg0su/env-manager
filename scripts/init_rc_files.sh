#!/bin/bash
echo "* Init rc files..."

script_path=`dirname $0`
source_path=`realpath ${script_path}/settings`


function init_files {
 for path in `find $1 -maxdepth 1 -not -path $1`; do
  target_path=`realpath ${path}`
  echo "! Try to replace \`${target_path}\` -> \`${path}\`"
  ln -sf ${target_path} ${HOME}
 done
}

init_files ${source_path}

