distro=$(uname)

if [ $distro == "Linux" ]; then
	alias pbcopy="xclip -sel clipboard"
fi
