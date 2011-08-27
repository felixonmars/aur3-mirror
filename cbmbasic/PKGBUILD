# Maintainer: Manalishi <manalishi at freenet dot de>
pkgname=cbmbasic
pkgver=1.0
pkgrel=5
pkgdesc="A 100% compatible version of Commodore's version of Microsoft BASIC 6502."
arch=('i686' 'x86_64')
url="http://cbmbasic.sourceforge.net/"
license=('BSD')
provides=('cbmbasic')
source=( "http://sourceforge.net/projects/cbmbasic/files/cbmbasic/1.0/${pkgname}-${pkgver}.tgz"
	 "Makefile.diff"
	 "LICENSE" )
md5sums=( '966cf93950809c3eace244af702cf895'
          'e5741a3bea19bcf78927044f02f911ca'
          '9cf04f76f29acab7288c1148ca3cd1dc' )

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -uN Makefile ../Makefile.diff || return 1
  make || return 1
}

package() {
  cd "${srcdir}/"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" || return 1

  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -D cbmbasic "${pkgdir}/usr/bin/cbmbasic" || return 1
  install -D -m644 README.txt  "${pkgdir}/usr/share/${pkgname}/README.txt" || return 1

  cd "${srcdir}/${pkgname}-${pkgver}/test"
  install -D -m644 sieve.bas "${pkgdir}/usr/share/${pkgname}/test/sieve.bas" || return 1
}
