# Shell Bookmark

export BMPATH=$HOME/.bms
function bj 
{
	cd -P "$BMPATH/$1" 2>/dev/null || echo "No Such bookmark: $1"
}

function bm 
{
	mkdir -p "$BMPATH"
	ln -s "$(pwd)" "$BMPATH/$1"
}

function bd 
{
	local a
	read -n 1 -p "Do you want to delete bookmark \"$1\" (y/n):" a
	echo
	if [[ "$a" == "y" || "$a" == "Y" ]] 	
	then
		rm "$BMPATH/$1" 2>/dev/null || echo "Fail to delete bookmark" && return
		echo Deleted!
	fi
}

function bl 
{
	ls -l "$BMPATH"  | cut -d' ' -f10- | sed 's/\(.*\)->/\\\\033[34m \1 \\\\033[0m\t->/' | xargs -I{} echo -e {} && echo
}

_bj_complete_func()
{
	local cur="${COMP_WORDS[COMP_CWORD]}"  
	local wlist="$(find $BMPATH -type l -printf "%f\n")"
	local filterlist=$(compgen -W "${wlist// /\\ }" -- "${cur}")
	local supplementlis=`echo -e "${filterlist}" | sed 's/\([^a-zA-Z0-9+,._-]\)/\\\\\1/g'`

	OLD_IFS="$IFS"
	IFS=$'\n'
	COMPREPLY=(${supplementlis})
	IFS="${OLD_IFS}"
}

complete -F _bj_complete_func bj bd

