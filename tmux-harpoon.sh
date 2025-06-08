#!/bin/bash

switch() {
	selected=$1
	line_count=$(wc -l < ~/bin/scripts/tmux-harpoon/session-list)

	if [ "$line_count" -ge "$selected" ]; then
		session=$(sed -n "${selected}p" ~/bin/scripts/tmux-harpoon/session-list)
		tmux switch -t "${session}"
	else
		echo "There is not a session available"
	fi
}

add() {
	piped_content=$(cat)

	already_contains=false

	while IFS= read -r line; do
		if [ "$line" = "$piped_content" ]; then
			already_contains=true
		fi
	done < ~/bin/scripts/tmux-harpoon/session-list

	
	if [ "$already_contains" = false ]; then
		echo "$piped_content" >> ~/bin/scripts/tmux-harpoon/session-list
	fi
}

view() {
	tmux display-popup -d "~/bin/scripts/tmux-harpoon/" -E -- sh -c 'vim "$@"' -- ~/bin/scripts/tmux-harpoon/session-list
}

help() {
	echo "figure it out"
}

main() {
	while getopts ":haAr:R:d:ls:e" opt; do
		case "$opt" in
			h | :) help && exit 0 ;;
			a) add ;;
			s) switch "$OPTARG" ;;
			l) view ;;
		esac
	done
}

main "$@"
