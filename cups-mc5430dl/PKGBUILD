# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# For Konica Minolta magicolor 5430 Desklaser

pkgname=cups-mc5430dl
pkgver=1.8.0
pkgrel=2
pkgdesc="CUPS driver for Konica Minolta magicolor 5430 Desklaser printer"
arch=(i686 x86_64)
url="http://konicaminolta.com/"
license="GPL"
depends=('libcups' 'ghostscript' 'lcms' 'jbigkit')
source=(http://www.openprinting.org/download/printing/konicaminolta/magicolor5430DL-$pkgver.tar.gz rastertokmlf.patch)
md5sums=('1460477f2dd195c301e961a6cbfe1f54' 'c547f194c0a0faf55cd108e94627790c')

build() {
	cd $startdir/src/magicolor5430DL-$pkgver
	# fix for compiling with CUPS 1.1.x AND 1.2.x
	patch -Np1 -i ../rastertokmlf.patch || return 1
	sed -i '/KM_PPDDIR/s#/usr/share/cups/model/KONICA_MINOLTA#"$datadir/cups/model"#' ./configure
	sed -i "/KM_DATADIR/s#KONICA_MINOLTA/mc5430DL#$pkgname#" ./configure
        ./configure --prefix=$startdir/pkg/usr
        make || return 1
        make install || return 1
	rm $startdir/pkg/usr/share/cups-mc5430dl/COPYING
}
