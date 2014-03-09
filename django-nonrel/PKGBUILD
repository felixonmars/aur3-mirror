# Maintainer: TDY <tdy@archlinux.info>

pkgname=django-nonrel
pkgver=1.6c1
pkgrel=1
pkgdesc="A Django fork with support for NoSQL databases"
arch=('any')
url="http://django-nonrel.org/"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
optdepends=('django-mongodb-engine: MongoDB Django module')
provides=('python2-django')
conflicts=('python2-django')
source=(https://github.com/$pkgname/django/archive/$pkgver.tar.gz)
sha256sums=('f10b6c9a5323b617f09dddf0318f661d87c654b3e69179d4dc611bf7d45ef789')

build() {
  cd "$srcdir/${pkgname%-*}-$pkgver"
  find -name '*.py' -exec sed -i '1s/python/&2/' '{}' \;
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname%-*}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
