# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=keepnote
pkgver=0.7.7
pkgrel=1
pkgdesc="A note taking application"
arch=('any')
url="http://keepnote.org/"
license=('GPL')
depends=('pygtk' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('pygtksourceview2: syntax highlighting support'
            'python2-gtkspell: spell shecking support')
install=$pkgname.install
source=(http://keepnote.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('e39e0ef52c0a8754b30b1ddfee4d0654')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|' keepnote/tarfile.py

  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root=$pkgdir/ --optimize=1
}
