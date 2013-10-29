# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python-pybuspirate-git'
pkgver=ffb5fb0
pkgrel=1
pkgdesc="Library for the Hack-A-Day Bus Pirate"
url="https://github.com/audiohacked/pyBusPirate"
arch=('any')
license=('GPL3')
depends=('python')
source=('git+https://github.com/audiohacked/pyBusPirate.git#branch=python3')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $srcdir/pyBusPirate
  python setup.py install --root="$pkgdir/"
  install -d $pkgdir/usr/share/$pkgname/
  cp i2c-test.py SPIFlash.py spi_test_binmode.py test.py $pkgdir/usr/share/$pkgname/
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
