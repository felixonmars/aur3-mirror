# Maintainer: Shaun Westmacott <xyem@electricjungle.org>

pkgname=epsxe-plugin-spu-peops-alsa
pkgver=1.9
pkgrel=1
pkgdesc="SPU plugins for ePSXe"
license=('GPL')
arch=('i686')
url="http://www.pbernert.com"
depends=('epsxe')
source=(http://downloads.sourceforge.net/project/peops/peopsspu/P.E.Op.S.%20Sound%20SPU%201.9/PeopsSpu109.tar.gz pentium.patch alsa.patch)
md5sums=('ba24351a3c7e28f5b69c272491260e44'
         'c0f3494d589983d55d6cad7c6759d439'
         'e6f1880d2e00b724138104c928ddde01')

build()
	{
	cd "$srcdir/src"
	
	patch -p2 -i ../pentium.patch
	patch -p2 -i ../alsa.patch
	make
	}

package()
	{
	cd "$srcdir/src"
	
	install -Dm644 libspuPeopsALSA.so.1.0.9 "$pkgdir/opt/epsxe/plugins/libspuPeopsALSA.so.1.0.9"
	}
