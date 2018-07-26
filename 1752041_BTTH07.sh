#! /bin/bash

makeAMakefile()
{
    filethucthi=$1
    shift
    echo "all : $filethucthi"
    echo "clean :"
    echo -e "\trm -f *.o $filethucthi"
    echo -n "$filethucthi :"
    for i in $*
    do
	temp=${i/".c"/".o"}
	echo -n " $temp"
    done
    echo -e -n "\n\tgcc"
    for i in $*
    do
	temp=${i/".c"/".o"}
	echo -n " $temp"
    done
    echo -n " -o $filethucthi"
    echo -e "\n"
    for i in $*
    do
	temp=${i/".c"/".o"}
	echo -e "\n$temp : $i"
	echo -n -e "\tgcc -c $i"
    done
    echo -e "\ndepend:"
    echo -e "\tmakedepend *.c"
    echo "# DO NOT DELETE"
}

set "filethucthi filec1.c filec2.c"
makeAMakefile $*
