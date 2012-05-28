# Maintainer: David Mikalova <superfuzzykittens at gmail dot com>
pkgname=brocket
pkgver=2.1
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
md5sums=('1b70f45befe082165e61b78354b121d2')

build() {
  install -Dm 755 $srcdir/brocket ${pkgdir}/usr/bin/brocket
}
