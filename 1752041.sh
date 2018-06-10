#! /bin/bash
duongdan=null
while ! test -a $duongdan
do
    echo "Nhap duong dan: "
    read duongdan
done
cd $duongdan
echo "Ban co muon xoa toan bo thu muc va tiep tuc khong(yes/no): "
read chon
if test "$chon" = "yes"
then
    rm -r *
fi
mkdir BTTH BTTL
mkdir BTTH/BTTH{1,2,3,4,5,6,7,8,9}
mkdir BTTL/BTTL{1,2,3,4,5,6,7,8,9}
line1="#! $BASH"
line2="/*========================"
line3="*Ho va ten: Nguyen Tan Phuoc "
line4="*MSSV: 1752041 "
line5="*Ma bai tap: LAB03"
line6="*========================="
line7="*/ "
for dir in $duongdan/BTT?/BTT??
do
    touch $dir/1752041.sh
    chmod u+x $dir/1752041.sh
    ls -l $dir/1752041.sh
    echo $line1 > $dir/1752041.sh
    echo $line2 >> $dir/1752041.sh
    echo $line3 >> $dir/1752041.sh
    echo $line4 >> $dir/1752041.sh
    echo $line5 >> $dir/1752041.sh
    echo $line6 >> $dir/1752041.sh
    echo $line7 >> $dir/1752041.sh
done
cat BTTH/BTTH1/1752041.sh
echo "Thu muc da tao xong va ket thuc"
