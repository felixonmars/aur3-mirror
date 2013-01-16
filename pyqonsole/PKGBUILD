# Maintainer: TDY <tdy@archlinux.info>

pkgname=pyqonsole
pkgver=0.2.0
pkgrel=1
pkgdesc="An X terminal emulator written in Python"
arch=('i686' 'x86_64')
url="http://www.logilab.org/project/pyqonsole/"
license=('custom')
depends=('pyqt3')
makedepends=('python2-distribute')
source=(http://ftp.logilab.org/pub/$pkgname/$pkgname-$pkgver.tar.gz
        http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt)
md5sums=('9a11625af5fcbb2f36f7a8721f6af67b'
         '2d740db2d9a00ce8e4d54d3ea8789b5a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 ../Licence_CeCILL_V2-en.txt \
    "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
