# Contributor: rabyte <rabyte__gmail>

pkgname=igelle-connector
pkgver=0.3.0
pkgrel=1
pkgdesc="A versatile network connection manager and configuration utility"
arch=('i686' 'x86_64')
url="http://www.ossproject.org/projects/igelle-connector/"
license=('GPL3')
depends=('wpa_supplicant' 'ppp' 'dhclient' 'pygtk' 'dbus-python')
source=(http://www.ossproject.org/files/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('e829c19c10cc5a5008d67d04721fff34')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./prepare.sh install=$pkgdir/usr || return 1
}

# vim:set ts=2 sw=2 et:
