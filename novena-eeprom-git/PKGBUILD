# Novena EEPROM utility.
# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=novena-eeprom
pkgbase=$pkgname-git
pkgver=2.3.0.gb3de8b9
pkgrel=1
pkgdesc='Tool for manipulating the Novena onboard EEPROM'
arch=('armv7h')
url="https://github.com/xobs/novena-eeprom/"
license=('BSD3')
srcname=novena-usb-hub
makedepends=('git sed')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/xobs/novena-eeprom.git'
  'add-i2c-header.patch')
md5sums=('SKIP'
         'fe47fbe61391dca66465bfa0eaf4acaa')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "${srcdir}/$pkgname"
  patch -Np1 -i ../add-i2c-header.patch
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 novena-eeprom $pkgdir/usr/bin/novena-eeprom
  install -Dm644 novena-eeprom.8 $pkgdir/usr/share/man/man8/novena-eeprom.8
  install -Dm644 debian/copyright $pkgdir/usr/share/novena-eeprom/copyright
}

# vim:set ts=2 sw=2 et:
