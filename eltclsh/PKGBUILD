# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname='eltclsh'
pkgver='1.14'
pkgrel=1
pkgdesc='A Tcl shell enhanced with libedit (editline)'
arch=('i686' 'x86_64')
url='http://homepages.laas.fr/mallet/soft/shell/eltclsh'
license=('BSD')
depends=('tcl' 'libedit')
source=("http://distfiles.openrobots.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('53f7a8c0caeaece66bee62ed113ba53e356dc1a0a086d595c12664810ef287bb')

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
