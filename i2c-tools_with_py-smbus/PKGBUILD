# Maintainer: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=i2c-tools_with_py-smbus
_pkgname=i2c-tools
pkgver=3.1.0
pkgrel=1
pkgdesc="Heterogeneous set of I2C tools for Linux that used to be part of lm-sensors. With py-smbus"
arch=('i686' 'x86_64')
url="http://www.lm-sensors.org/wiki/I2CTools"
license=('GPL')
depends=('python2' 'lm_sensors' 'perl' 'read-edid')
options=(strip)
source=(http://dl.lm-sensors.org/$_pkgname/releases/$_pkgname-$pkgver.tar.bz2 Makefile.patch)
md5sums=('f15019e559e378c6e9d5d6299a00df21'
         'dcd24c63bbd61aa9cb1ded29c074d33a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -p0 < $startdir/Makefile.patch
  make || return 1
  make DESTDIR="$pkgdir" install

  cd py-smbus
  CFLAGS="-I../include"
  python2 setup.py install --prefix=$pkgdir/usr
}
# vim:set ts=2 sw=2 et:
