#!/bin/bash
echo "* Install vim plugins with vundle..."

vim_dir="${HOME}/.vim"
bundle_dir="${vim_dir}/bundle"
if [[ ! -d ${vim_dir} ]]; then
 echo "! Not found vim_dir: ${vim_dir}"
 exit -1
fi 

mkdir -p ${bundle_dir}
git clone https://github.com/VundleVim/Vundle.vim.git ${bundle_dir}/Vundle.vim
vim +PluginInstall +qall
