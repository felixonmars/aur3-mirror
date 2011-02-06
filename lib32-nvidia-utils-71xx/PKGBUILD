# $Id: PKGBUILD,v 1.10 2007/06/25 14:03:19 Neverth Exp $
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributed by: Karsten Anderson <orbitcoder@gmail.com>
pkgname=lib32-nvidia-utils-71xx
pkgver=7185
pkgrel=1
pkgdesc="NVIDIA drivers utilities and libraries for legacy driver."
url="http://www.nvidia.com/"
arch=(x86_64)
groups=('lib32')
depends=('lib32-libxext')
conflicts=('lib32-libgl' 'lib32-ati-fglrx-utils' 'lib32-nvidia-utils')
provides=('lib32-libgl')
source=(ftp://ftp.archlinux.org/extra/os/i686/nvidia-71xx-utils-1.0.$pkgver-$pkgrel.pkg.tar.gz)
md5sums=('21d86d6862180e150e8f0a4a3339919d')

build() {
	cd $startdir/src
	mkdir -p $startdir/pkg/opt/lib32/usr/lib
	cp -dp usr/lib/*.so* $startdir/pkg/opt/lib32/usr/lib
	
	# fix wrnog links
	cd $startdir/pkg/opt/lib32/usr/lib
	ln -sf libGL.so.$pkgver libGL.so
	ln -sf libGL.so.$pkgver libGL.so.1
	ln -sf libGLcore.so.$pkgver libGLcore.so.1
	ln -sf libnvidia-cfg.so.$pkgver libnvidia-cfg.so.1
	ln -sf libnvidia-tls.so.$pkgver libnvidia-tls.so.1
}
