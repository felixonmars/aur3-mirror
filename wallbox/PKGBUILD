# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Yuren Ju <yurenju@gmail.com>

pkgname=wallbox
pkgver=0.4.2
pkgrel=1
pkgdesc="Facebook notification for linux"
arch=('any')
url="http://github.com/yurenju/wallbox"
license=('GPL')
depends=('python2' 'pygtk' 'pyfacebook-git')
makedepends=('python2-distribute' 'gnome-common')
source=(https://github.com/downloads/yurenju/$pkgname/${pkgname}-$pkgver.tar.gz)
md5sums=('688374cdfc2054149f7470132eb5a844')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find $srcdir/ -name '*.py')
  
  PYTHON=/usr/bin/python2 ./autogen.sh --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find $pkgdir/ -name '*applet')
}

# vim:set ts=2 sw=2 et:
