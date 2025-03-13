if [ $# -lt 1 ]; then
    echo 'missing core amount\n'
    exit
elif [ $# -gt 1 ]; then
    echo 'only one argument is allowed\n'
    exit
fi

echo "building with config with $1 cores"
make -j$1 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs

