# Contributor: Karol Maciaszek <karol.maciaszek@czystybeton.pl>
pkgname=wmxmms-spectrum
pkgver=0.5
pkgrel=2
pkgdesc="XMMS visualisation plugin that displays a spectrum analyser in a WindowMaker dock application" 
url="http://archive.debian.net/woody/hppa/wmxmms-spectrum" 
license="GPL" 
arch=(i686 x86_64)
depends=('gtk>=1.2 xmms') 
makedepends=('')
source=("http://archive.debian.org/debian/pool/main/w/wmxmms-spectrum/${pkgname}_$pkgver.orig.tar.gz")
md5sums=('ca0999c6ff1a3961cd4ad4f892d8aa03')
build() { 
	cd $startdir/src/wmxmms_spectrum-$pkgver.orig || return 1
	patch $startdir/src/wmxmms_spectrum-$pkgver.orig/Makefile $startdir/makefile.patch
	make || return 1
	install -d $startdir/pkg/usr/lib/xmms/Visualization
	install -m 644 $startdir/src/wmxmms_spectrum-$pkgver.orig/wmxmms_spectrum.so $startdir/pkg/usr/lib/xmms/Visualization
}

