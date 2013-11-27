# Maintainer: perlawk

pkgname=binprolog
_pkgname=BinProlog
pkgver=12.0
pkgrel=1
pkgdesc="binProlog, the open source edition of a c-based prolog"
arch=('x86_64' 'i686')
url="http://binprolog.googlecode.com"
license=('GPL')
source=( "http://binprolog.googlecode.com/files/BinProlog.zip")

build() {
	cd ${srcdir}/${_pkgname}/src
	if [ $CARCH == 'i686']; then
		make linux32_mt
	else
		make linux_mt
	fi
}

package() {
	cd ${srcdir}/${_pkgname}/
  install -Dm755 bin/bp "${pkgdir}/usr/bin/bp"

  install -m755 -d "${pkgdir}/usr/share/${pkgname}/library"
  install -m755 -d "${pkgdir}/usr/share/${pkgname}/progs"
  install -m755 library/* "${pkgdir}/usr/share/${pkgname}/"library
  install -m755 progs/* "${pkgdir}/usr/share/${pkgname}/"progs
}

md5sums=('f47ca0ba18387b4bbc9185df791c8ddc')
