# Maintainer: Igor Dejanovic <igor DOT dejanovic AT gmail DOT com>
# Contributor: Igor Dejanovic <igor DOT dejanovic AT gmail DOT com>
pkgname=qshowdiff
pkgver=1.2
pkgrel=1
pkgdesc="Diff visualization tool"
arch=('i686' 'x86_64')
url="http://qshowdiff.danfis.cz/"
license=('GPL')
depends=('qt')
source=("http://qshowdiff.danfis.cz/files/qshowdiff-$pkgver.tar.gz")

build() {

	cd ${srcdir}/${pkgname}-${pkgver}
	make DEFAULT_CODEC=utf-8 || return 1

}

package() {

  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/{bin,man/man1} || return 1
  make PREFIX=${pkgdir}/usr install || return 1

}

md5sums=('df8122e6c956d8c17c645d3c4596e576')
