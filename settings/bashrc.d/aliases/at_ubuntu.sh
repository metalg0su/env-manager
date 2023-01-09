distro=$(uname)

if [ $distro == "Linux" ]; then
	alias pbcopy="xclip -sel clipboard"
	alias pbpaste="xclip -sel clipboard -o > "
	alias open="xdg-open"
fi
