distro=$(uname)

if [ $distro == "Linux" ]; then
	alias pbcopy="xclip -sel clipboard"
	alias open="xdg-open"
fi
