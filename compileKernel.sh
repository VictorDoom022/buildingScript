echo "***********************************************"
echo "          Clonning Proton Clang"
echo "***********************************************"
git clone https://github.com/kdrag0n/proton-clang -b master clang
echo "***********************************************"
echo "          Clonning AnyKernel"
echo "***********************************************"
git clone https://github.com/VictorDoom022/AnyKernel3.git -b master AnyKernel
echo "***********************************************"
echo "              DONE CLONNING"
echo "***********************************************"
KERNEL_DIR=$(pwd)
IMAGE="${KERNEL_DIR}/out/arch/arm64/boot/Image.gz-dtb"
TANGGAL=$(date +"%Y%m%d-%H")
export PATH="$(pwd)/clang/bin:$PATH"
export KBUILD_COMPILER_STRING="$($kernel/clang/bin/clang --version | head -n 1 | perl -pe 's/\((?:http|git).*?\)//gs' | sed -e 's/ */ /g' -e 's/[[:space:]]*$//' -e 's/^.*clang/clang/')"
export ARCH=arm64
export KBUILD_BUILD_USER=VictorVanDoom
function compile() {
    make -j$(nproc) O=out ARCH=arm64 tissot_defconfig
    make -j$(nproc) O=out \
                    ARCH=arm64 \
                      CC=clang \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi- \

    if ! [ -a "$IMAGE" ]; then
        exit 1
        echo "There are some issues"
    fi
    cp out/arch/arm64/boot/Image.gz-dtb AnyKernel
}

function zipping() {
    cd AnyKernel || exit 1
    zip -r9 Doom-Kernel-${TANGGAL}.zip *
}
compile
zipping