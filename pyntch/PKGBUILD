# Maintainer: spider-mario <spidermario@free.fr>
pkgname=pyntch
pkgver=20091028
pkgrel=1
pkgdesc="Static code analyzer for Python"
arch=('any')
url="http://www.unixuser.org/~euske/python/$pkgname/"
license=('custom:MIT')
depends=('python2')
options=(!emptydirs)
source=(http://www.unixuser.org/~euske/python/$pkgname/$pkgname-$pkgver.tar.gz
        LICENSE)
md5sums=('59e24f152f81c5364761b29d246380b9'
         'd31715998f32b56a328fef0179d69eeb')

build() {
  find "$srcdir/$pkgname-$pkgver" -iname '*.py*' -exec \
    perl -pe 's{(?<=#!/usr/bin/env python)(?!2)}{2} if 1 .. 1;' -i {} \;
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k PYTHON=python2 check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install --directory "$pkgdir"/usr/share/licenses/$pkgname
  install --mode=644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
