# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-bsdiff4
pkgver=1.1.4
pkgrel=1
pkgdesc="binary diff and patch using the BSDIFF4-format"
arch=('i686' 'x86_64')
url="https://github.com/ilanschnell/bsdiff4"
license=('BSD')
depends=('python2')
makedepends=('python2-distribute' 'gcc')

source=("https://github.com/ilanschnell/bsdiff4/archive/$pkgver.tar.gz"
        "LICENSE.txt")
md5sums=('dfbee53ae20f8d91c18a47f4eae563a4'
         'ae6f5df0e6d4dd4ea3cc20aafb2dd10f')

build() {
  cd "$srcdir/bsdiff4-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/bsdiff4-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

