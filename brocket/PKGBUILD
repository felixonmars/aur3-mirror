# Maintainer: David Mikalova <superfuzzykittens at gmail dot com>
pkgname=brocket
pkgver=1.2.1
pkgrel=1
pkgdesc='A launcher for X11 WMs that attempts to prevent multiple instances.'
arch=(any)
url=https://github.com/superfuzzykittens/brocket
license=('GPL')
groups=()
depends=('bash' 'wmctrl')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(brocket)
md5sums=('b96ac0f34abe25ab83a73f7fb6a42c06')

build() {
  install -Dm 755 $srcdir/brocket ${pkgdir}/usr/bin/brocket
}
