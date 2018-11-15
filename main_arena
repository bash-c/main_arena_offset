#!/usr/bin/env bash
# set -eux

:<<DESCRIPTION
	This is a simple shell script to get main_arena offset of a given libc.
	Usage: $ main_arena your_libc
	avaiable on <https://github.com/bash-c/main_arena_offset>
DESCRIPTION


:<<COLORS
	Change the color of output stream as you like.
COLORS
black='\033[0;30m'
dark_gray='\033[1;30m'
light_gray='\033[0;37m'
blue='\033[0;34m'
light_blue='\033[1;34m'
green='\033[0;32m'
light_green='\033[1;32m'
cyan='\033[0;36m'
light_cyan='\033[1;36m'
red='\033[0;31m' 
light_red='\033[1;31m'
purple='\033[0;35m'
light_purple='\033[1;35m'
brown='\033[0;33m'
yellow='\033[1;33m'
white='\033[1;37m'
default_color='\033[00m'
red_bold='\033[01;31m'

endc='\033[0m' 

slogan_color=$light_green
result_color=$red_bold

:<<print_info
	This function is set to print the result.
	Use it like:
	print_info libc_version buildID main_arena_offset.
print_info
function print_info()
{
	printf "$slogan_color[+]libc version :$endc$result_color %s$endc\n" "$1"
	printf "$slogan_color[+]build ID :$endc$result_color %s$endc\n" "$2"
	printf "$slogan_color[+]main_arena_offset :$endc$result_color 0x%x$endc\n" $3
	exit
}


:<<get_offset
	As its name suggests, get_offset() is the function to get result.

	It works on the following princple:
	for 32-bit so:
		main_arena_offset = __malloc_hook_offset + 0x18
			I think it's wired but it works out for all the libcs in libc_database. Please let me know if you find any 32-bit libc with a wrong result.
	
	for 64-bit so:
		main_arena_offset - __malloc_hook_offset = (__realloc_hook_offset - __malloc_hook_offset) * 2
get_offset
function get_offset()
{
	libc=$1
	# deal with local libc(in case of symbolic link)
	if [[ $(file $libc) =~ "symbolic link" ]]
	then
		libc=$(dirname $libc)"/"$(readlink $libc)
	fi

	# libc version
	libc_version=$(strings $libc | grep "glibc 2"| head -n 1)

	# buildID
	buildID=$(file $libc| grep -o "BuildID\[sha1\]=[a-f0-9]\{40,\}")

	# __malloc_hook
	malloc_hook=$(objdump -j .data -d $libc|grep __malloc_hook |cut -d" " -f 1)
	let malloc_hook=16#$malloc_hook

	# 32-bit
	if [[ $(file $libc) =~ "32-bit" ]]
	then
		let main_arena=($malloc_hook+0x18)
		print_info "$libc_version" "$buildID" $main_arena
	fi
	
	# 64-bit
	realloc_hook=$(objdump -j .data -d $libc|grep __realloc_hook |cut -d" " -f 1)
	let realloc_hook=16#$realloc_hook
	((offset=$malloc_hook-$realloc_hook))
	
	let main_arena=($malloc_hook+$offset*2)
	print_info "$libc_version" "$buildID" $main_arena
}

:<<get_result
	get result by calling get_offset.
get_result
get_offset $1
