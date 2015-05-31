# Novena Software for Disabling Secure Simple Pairing
# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=novena-disable-ssp
pkgbase=$pkgname-git
pkgver=1.2.0.g698806c
pkgrel=1
pkgdesc='Disable SSP on all Bluetooth Adapters'
arch=('armv7h')
url="https://github.com/xobs/novena-disable-ssp/"
license=('BSD3')
srcname=$pkgname
depends=('bluez')
makedepends=('git sed bluez bluez-libs')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/xobs/novena-disable-ssp.git'
  'arch-linux-compile-fixup.patch')
md5sums=('SKIP'
         'bfc6a6b60ebfa65493f03de6bf939855')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "${srcdir}/$pkgname"
  patch -Np1 -i ../arch-linux-compile-fixup.patch
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 novena-disable-ssp $pkgdir/usr/bin/novena-disable-ssp
  install -Dm644 novena-disable-ssp.1 $pkgdir/usr/share/man/man1/novena-disable-ssp.1
}

# vim:set ts=2 sw=2 et:
