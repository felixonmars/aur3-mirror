# Maintainer: Jimmy Mabey <jimmymabey@gmail.com>
# Contributor: Ricardo Martins <ricardo@scarybox.net>

pkgname=python-see
pkgver=1.0.1
pkgrel=1
pkgdesc="An alternative to Python's dir()"
epoch=1
arch=('any')
url="http://inky.github.io/see/"
license=('BSD')
depends=('python')
changelog=$pkgname.changelog
source=(https://github.com/inky/see/archive/v$pkgver.tar.gz)
md5sums=('acf3fc10affdbacb984974d720dd1c38')

build() {
  cd see-$pkgver

  python setup.py build
}

package() {
  cd see-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
