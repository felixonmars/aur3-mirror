# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-tornadio2
pkgver=0.0.3
pkgrel=3
pkgdesc="Socket.io server implementation on top of Tornado"
arch=('any')
url="http://github.com/MrJoes/tornadio2"
license=('APACHE')
depends=('python' 'python-distribute' 'python-tornado')
source=($pkgname.zip::https://github.com/mrjoes/tornadio2/archive/master.zip)
sha256sums=('373c00689e70cf338dc1b85d3779d4f7f5faf00a9110983af9025c52cd0fbf8c')

build() {
  cd "$srcdir/"*tornadio2*

  find . -name "*.py" -print0 | xargs -0 2to3 -w -n --no-diffs
  python setup.py install --root="$pkgdir" --optimize=1
}

package() {
  cd "$srcdir/"*tornadio2*

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:
