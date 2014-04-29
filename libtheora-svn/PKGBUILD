# Maintainer: Marco <marcomania at home dot se>

pkgname=libtheora-svn
pkgver=0
pkgrel=3
pkgdesc="Theora open video compression codec developed by the Xiph.org (development version)"
url="http://www.theora.org"
arch=("i686" "x86_64")
license=("BSD")

depends=("libogg")
makedepends=("subversion" "autoconf")
conflicts=("libtheora")
provides=("libtheora=$pkgver")

_svnname=theora
_svnuri="http://svn.xiph.org/trunk/$_svnname"

source=("$pkgname::svn+$_svnuri")

sha256sums=("SKIP")

pkgver() {

  cd "${srcdir}/${pkgname}"
  echo $(svnversion | tr -d [A-z])

}

build() {

  cd "${srcdir}/${pkgname}"
  ./autogen.sh --prefix="/usr" --disable-examples
  make

}

package() {

  cd "${srcdir}/${pkgname}"
  make DESTDIR=${pkgdir} install

}
