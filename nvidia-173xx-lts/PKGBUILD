# $Id$
# Maintainer: pvg <pvg at poczta dot fm>

pkgname=nvidia-173xx-lts
pkgver=173.14.39
_extramodules=extramodules-3.14-lts
pkgrel=3
pkgdesc="NVIDIA drivers for linux-lts, 173xx branch."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('linux-lts>=3.14.0' 'linux-lts<3.15.0' "nvidia-173xx-utils=${pkgver}")
makedepends=('linux-lts-headers>=3.14.0' 'patch')
conflicts=('nvidia-96xx-lts' 'nvidia-lts' 'nvidia-304xx-lts')
license=('custom')
install=nvidia.install
source=("http://us.download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run" '173xx-linux-3.13.patch' 'nvidia_kernel_3.14.patch')
#source=("ftp://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run")
options=(!strip)
md5sums=('5b423543428554ef33a200fbbe3cb9fc'
         '80f4a1217648c54d604ac1c51734835b'
         '734234175e1b99a2bf3512a2cabbad8a')
[ "$CARCH" = "x86_64" ] && md5sums=('0799f194869e40141c7bac8a71762db6' '80f4a1217648c54d604ac1c51734835b' '734234175e1b99a2bf3512a2cabbad8a')
changelog='Changelog'
build() {
        _kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
	cd $srcdir
	sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
	cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
	cd usr/src/nv/
	patch -p1 < ${srcdir}/../173xx-linux-3.13.patch
	patch -p1 < ${srcdir}/../nvidia_kernel_3.14.patch
	ln -s Makefile.kbuild Makefile
	make SYSSRC=/usr/lib/modules/${_kernver}/build module
}

package() {
	cd $srcdir/NVIDIA-Linux-$ARCH-${pkgver}-pkg0/usr/src/nv/
	mkdir -p $pkgdir/usr/lib/modules/${_extramodules}/
	install -m644 nvidia.ko $pkgdir/usr/lib/modules/${_extramodules}/

        mkdir -p $pkgdir/usr/lib/modprobe.d
        echo "blacklist nouveau" >> $pkgdir/usr/lib/modprobe.d/nvidia-lts.conf
	sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" $startdir/nvidia.install
        # gzip -9 module
        gzip "${pkgdir}/usr/lib/modules/${_extramodules}/nvidia.ko"
        install -D -m644 "${srcdir}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0/LICENSE" "${pkgdir}/usr/share/licenses/nvidia-173xx-lts/LICENSE"
}
