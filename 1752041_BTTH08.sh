#! /bin/bash
help()
{
    echo "$0 -h|help -s|search -c|count -a|add -d|delete on phonebook"
}
search()
{
    file=$1
    echo -n "Nhap thong tin can tim kiem: "
    read info
    while read line
    do
	local temp={$line##*"$info"*}
	if test $temp!=$line
	then
	    echo "$line"
	fi
    done <<< $(cat $file)
}
count()
{
    local file=$1
    local i=0
    while read line
    do
	(($i = $i + 1))
    done <<<$(cat $file)
    echo "So luong danh muc: $i"
}
add()
{
    local file=$1
    echo "Nhap thong tin"
    echo -n "- Last Name: "
    read lastname
    echo -n "- First Name: "
    read firstname
    echo -n "- Phone: "
    read phone
    read -n "- Email: "
    read email
    local line="Last Name:$lastname;First Name:firstname;Phone:$phone;Email:$email"
    echo line >> $file
}
delete()
{
    local file=$1
    echo "Nhap so thu tu danh muc can xoa: "
    read stt
    touch newfile.txt
    local i=0
    while read line
    do
	(($i = $i + 1))
	if (($i != stt))
	then
	    echo $line >> newfile.txt
	fi
    done <<< $(cat $file)
    echo -n "" > $file
    while read line
    do
	echo $line >> $file
    done <<< $(cat $newfile.txt)
    rm -f newfile.txt
}
echo -n "Nhap duong dan: "
read duongdan
if ! test -d $duongdan
then
    echo "Sai duong dan"
    exit 1
fi
cd $duongdan
ls
echo -n "Chon danh ba: "
read danhba
if !test -a $danhba
then
    echo "Khong ton tai"
    exit
fi
if (($# < 2))
then
    help $*
    exit 1
fi
flag_h=false
flag_s=false
flag_a=false
flag_d=false
flag_c=false
for i in $*
do
    case "$i" in
	-h) flag_h=true;;
	-s) flag_s=true;;
	-c) flag_c=true;;
	-a) flag_a=true;;
	-d) flag_d=true;;
	*) ;;
    esac
done
if test $flag_h
then
    help $*
fi
if test $flag_s
then
    search $danhba
fi
if test $flag_c
then
    count $danhba
fi
if test $flag_a
then
    add $danhba
fi
if test $flag_d
then
    delete $danhba
fi


	
    
