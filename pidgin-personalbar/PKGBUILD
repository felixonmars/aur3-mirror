# Maintainer: SpepS <dreamspepser at yahoo dot it>
# Contributor: Michele Gastaldo <pikiweb@gmail.com>

pkgname=pidgin-personalbar
pkgver=104
pkgrel=1
pkgdesc="Allows to set a name and a personal message from your buddy list"
url="http://code.google.com/p/pidgin-personalbar/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('msn-pecan')
source=("http://$pkgname.googlecode.com/svn-history/r$pkgver/trunk/personalbar.c"
        "http://$pkgname.googlecode.com/svn-history/r$pkgver/trunk/Makefile")
md5sums=('16f2ed4ad925177322f6827060759f47'
         '7929656d121e3861392ae1a492f08e92')

build() {
  cd "$srcdir"

  make
}

package() {
  cd "$srcdir"

  make DESTDIR="$pkgdir/" install
}
