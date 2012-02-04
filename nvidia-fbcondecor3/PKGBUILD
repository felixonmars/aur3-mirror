# $Id: PKGBUILD 83850 2010-06-23 10:39:40Z pierre $
# Maintainer : wuyingren <keitaroh@gmail.com>
# Contributor : Thomas Baechler <thomas@archlinux.org>
# Adapted for fbcondecor by: Conrad Nelson

pkgname=nvidia-fbcondecor3
pkgver=280.13
_kernver='3.0.0-fbcondecor'
pkgrel=1
pkgdesc="NVIDIA drivers for linux kernel 3.0 patched with fbcondecor."
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('linux-fbcondecor' 'nvidia-utils')
makedepends=('linux-headers')
conflicts=('nvidia-96xx' 'nvidia-173xx')
license=('custom')
install=nvidia-fbcondecor3.install

if [ "$CARCH" = "i686" ]; then
        _arch='x86'
        _pkg="NVIDIA-Linux-${_arch}-${pkgver}"
        source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
        md5sums=('c3992c8cef02b7773a398640d8830e77')
elif [ "$CARCH" = "x86_64" ]; then
        _arch='x86_64'
        _pkg="NVIDIA-Linux-${_arch}-${pkgver}-no-compat32"
        source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run")
        md5sums=('05e62b61feb34bf412f83ca1074e1917')
fi

build() {
        cd $srcdir
        sh ${_pkg}.run --extract-only
        cd ${_pkg}/kernel
        make SYSSRC=/lib/modules/${_kernver}/build module
}

package() {
        install -D -m644 $srcdir/${_pkg}/kernel/nvidia.ko \
                $pkgdir/lib/modules/${_kernver}/kernel/drivers/video/nvidia.ko
        install -d -m755 $pkgdir/etc/modprobe.d
        echo "blacklist nouveau" >> $pkgdir/etc/modprobe.d/nouveau_blacklist.conf
        sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" $startdir/nvidia-fbcondecor3.install
}

