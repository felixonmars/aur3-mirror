# Submitter: Chris Brannon <cmbrannon79@gmail.com>
# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=python2-urllib3
_pkgname=urllib3
pkgver=1.8
pkgrel=1
pkgdesc="HTTP library with thread-safe connection pooling and file post support"
arch=('any')
url="http://github.com/shazow/urllib3"
license=('MIT')
depends=('python2')
makedepends=('setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shazow/$_pkgname/tarball/$pkgver"
        "LICENSE")
md5sums=('0de23a4244f34db3f15bdd3d2e0d9d5c'
         '350846ab4dd11ce105b570c15c1b0764')

package() {
  cd "$srcdir/shazow-urllib3-8a8c601"
  python2 setup.py install --root="$pkgdir"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}
