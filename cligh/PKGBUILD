# Maintainer: Chris Brannon <chris@the-brannons.com>
pkgname=cligh
pkgver=0.1
pkgrel=2
pkgdesc="Command-Line Interface to GitHub"
arch=(any)
url=http://the-brannons.com/software/cligh.html
license=(BSD)
depends=(python2 python-github2-git)
source=(http://the-brannons.com/software/$pkgname-$pkgver.tar.gz)
md5sums=('55737f4f9b064fcab0f584155606214b')

build() {
  /bin/true
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -m644 README.md AUTHORS "$pkgdir/usr/share/doc/$pkgname"
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}

# vim:set ts=2 sw=2 et:
