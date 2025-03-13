if [ $# -lt 1 ]; then
    echo 'missing file name\n'
    exit
elif [ $# -gt 1 ]; then
    echo 'only one argument is allowed\n'
    exit
fi

path=$1

if [ -d $path ]; then
    echo "目錄存在"
else
    echo "目錄不存在"
    exit
fi

KERNEL=kernal8

echo "back-up image file"
echo $KERNEL
cp $path/$KERNEL.img $path/$KERNEL-backup.img

echo "Loading Image file"
mkdir $path/$KERNEL.img
mkdir $path/
mkdir $path/overlays/
mkdir $path/overlays/

cp arch/arm64/boot/Image $path/$KERNEL.img
cp arch/arm64/boot/dts/broadcom/*.dtb $path/
cp arch/arm64/boot/dts/overlays/*.dtb* $path/overlays/
cp arch/arm64/boot/dts/overlays/README $path/overlays/