#!/bin/bash

getHexFromLine() {
	trimmedLine="$(echo -e "$1" | tr -d '[:space:]')"
	HEX=$(echo "$trimmedLine" | awk -F ':' '{print $2}')
}

# $1 should be the xresources line
# $2 should be the tmux color to set
setColorFromHex() {
	getHexFromLine "$line"
	prefix="tmux_"
	command="$prefix$2=$HEX"
	export "${command?}"
}

Xresources=~/.Xresources.colors

while read -r line; do
	#skip empty lines
	[ -z "$line" ] && continue
	case $line in

	*color15*)
		setColorFromHex "$line" light_white
		;;
	*color14*)
		setColorFromHex "$line" light_cyan
		;;
	*color13*)
		setColorFromHex "$line" light_magenta
		;;
	*color12*)
		setColorFromHex "$line" light_blue
		;;
	*color11*)
		setColorFromHex "$line" light_yellow
		;;
	*color10*)
		setColorFromHex "$line" light_green
		;;
	*color9*)
		setColorFromHex "$line" light_red
		;;
	*color8*)
		setColorFromHex "$line" light_black
		;;
	*color7*)
		setColorFromHex "$line" white
		;;
	*color6*)
		setColorFromHex "$line" cyan
		;;
	*color5*)
		setColorFromHex "$line" magenta
		;;
	*color4*)
		setColorFromHex "$line" blue
		;;
	*color3*)
		setColorFromHex "$line" yellow
		;;
	*color2*)
		setColorFromHex "$line" green
		;;
	*color1*)
		setColorFromHex "$line" red
		;;
	*color0*)
		setColorFromHex "$line" black
		;;
	esac
done <$Xresources
