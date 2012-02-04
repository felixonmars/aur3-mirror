# Contributor : Giuseppe Calderaro <giuseppecalderaro@gmail.com>

pkgname=nvidia-ice
pkgver=270.41.19
_kernver='2.6.38-ice'
pkgrel=1
pkgdesc="NVIDIA drivers for kernel26-ice."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=("kernel26-ice" "nvidia-utils=${pkgver}")
conflicts=('nvidia-96xx-ice' 'nvidia-173xx-ice' 'nvidia-ice-beta')
license=('custom')
install=nvidia-ice.install

if [ "$CARCH" = "i686" ]; then
    _arch='x86'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
    source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums=('c167e32702f56599bd600add97943312')
elif [ "$CARCH" = "x86_64" ]; then
    _arch='x86_64'
    _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
    source=("ftp://download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
    md5sums=('cb518bdd70f356425b8c4a5a48c0ad9c')
fi

build() {
    cd $srcdir
    sh ${_pkg}.run --extract-only
    cd ${_pkg}/kernel
    make SYSSRC=/lib/modules/${_kernver}/build module || return 1
}

package() {
    install -D -m644 $srcdir/${_pkg}/kernel/nvidia.ko \
        $pkgdir/lib/modules/${_kernver}/kernel/drivers/video/nvidia.ko || return 1
    install -d -m755 $pkgdir/etc/modprobe.d
        echo "blacklist nouveau" >> $pkgdir/etc/modprobe.d/nouveau_blacklist.conf || return 1
    sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/nvidia-ice.install
}

