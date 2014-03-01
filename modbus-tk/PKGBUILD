# Contributor: Johannes Martin <dorhonzor@gmail.com>
pkgname=modbus-tk	
pkgver=0.4.2
pkgrel=2
pkgdesc="Modbus Test Kit: Implementation of Modbus protocol in python"
arch=('i686' 'x86_64')
url="http://code.google.com/p/modbus-tk/"
license=('GPL')
depends=(python2)
makedepends=(setuptools)
source=(http://modbus-tk.googlecode.com/files/$pkgname-$pkgver.zip)
md5sums=('50c0e09c03d90d851e850e0ff49f9ce2')

package() {
  cd "$srcdir"
  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
}

# vim:set ts=2 sw=2 et:
