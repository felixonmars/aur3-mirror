# Maintainer: David Mikalova <superfuzzykittens at gmail dot com>
pkgname=brocket
pkgver=2.0
pkgrel=1
pkgdesc='A launcher for X11 WMs that attempts to prevent multiple instances.'
arch=(any)
url=https://github.com/superfuzzykittens/brocket
license=('GPL')
groups=()
depends=('bash' 'wmctrl' 'bc')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(brocket)
md5sums=('e155c4a3c9262464e9ad508326a0fafb')

build() {
  install -Dm 755 $srcdir/brocket ${pkgdir}/usr/bin/brocket
}
