pkgname=nvidia-builder
pkgver=190.53
pkgrel=1
pkgdesc="NVIDIA drivers"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && ARCH=x86
[ "$CARCH" = "x86_64" ] && ARCH=x86_64
url="http://www.nvidia.com/"
depends=('kernel26' 'nvidia-utils=190.53')
license=('custom')
source=("http://download.nvidia.com/XFree86/Linux-$ARCH/${pkgver}/NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run"
	      "buildmodule-nvidia")
md5sums=('2e80419f6f9ac16beecd839874d0c5ab'
         '4d58d73c9addd99fd0831ebe9510759f')
[ "$CARCH" = "x86_64" ] && md5sums=('c9827059697001fa61518e56fdc24e93')
build() {
	cd $srcdir
	sh NVIDIA-Linux-$ARCH-${pkgver}-pkg0.run --extract-only
	cd NVIDIA-Linux-$ARCH-${pkgver}-pkg0
        mkdir -p ${pkgdir}/usr/sbin
        mkdir -p ${pkgdir}/usr/src/nvidia
        cp -r usr/src/nv/* ${pkgdir}/usr/src/nvidia/
        install -Dm644 ${srcdir}/buildmodule-nvidia ${pkgdir}/usr/sbin/
        chmod +x ${pkgdir}/usr/sbin/buildmodule-nvidia
}
