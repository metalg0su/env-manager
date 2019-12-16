#!/bin/bash
echo "* Run ..."

current_path=`dirname $0`
current_path=`realpath ${current_path}`
script_path="${current_path}/scripts"
echo "> Current path: ${current_path}"
echo "> Script path: ${script_path}"

# ----- scripts
echo "${script_path}/init_rc_files.sh"
echo "${script_path}/install_vim_plugins.sh"

cat ${script_path}/init_rc_files.sh | bash
cat ${script_path}/install_vim_plugins.sh | bash
