#!/bin/bash

# ---------
read -p "create symbolic link? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "..."
else
    exit 1
fi

SOURCE_DIR=./settings

# 절대 경로로 변환
SOURCE_DIR=$(realpath "$SOURCE_DIR")

echo "소스 폴더: $SOURCE_DIR"
echo "타겟 폴더: $HOME"
echo ""

# 소스 폴더의 모든 파일에 대해 심볼릭 링크 생성
find "$SOURCE_DIR" -maxdepth 1 -type f | while read -r file; do
    # 파일명 추출
    filename=$(basename "$file")
    target_link="$HOME/$filename"

    rm -f $target_link

#    심볼릭 링크 생성
    if ln -s "$file" "$target_link"; then
        echo "생성됨: $filename -> $file"
    else
        echo "오류: $filename 링크 생성 실패"
    fi
done

# ---------
read -p "tmux settings? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "..."
else
    exit 1
fi

cd
git clone --single-branch https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
# Local은 내꺼 쓰기
cd -

# ---------
read -p "git settings? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "..."
else
    exit 1
fi


rm -rf $HOME/.vim

mkdir -p $HOME/.vim/colors
cd $HOME/.vim/colors
wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/refs/heads/master/colors/jellybeans.vim
cd -

mkdir -p $HOME/.vim/bundle
cd $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall 2> /dev/null
cd -
