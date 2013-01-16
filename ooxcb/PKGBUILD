# Maintainer: TDY <tdy@archlinux.info>

pkgname=ooxcb
pkgver=1.2
pkgrel=1
pkgdesc="An object-oriented X Python binding based on xpyb"
arch=('any')
url="http://pypi.python.org/pypi/ooxcb"
license=('BSD')
depends=('libxcb' 'python2>=2.5')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/o/ooxcb/ooxcb-$pkgver.tar.gz
        LICENSE)
md5sums=('a9dc6d3886d0414193ed1068dce573ba'
         '3970f82a1b5a32142fd4c42c006da75d')

build() {
  cd "$srcdir/ooxcb-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
