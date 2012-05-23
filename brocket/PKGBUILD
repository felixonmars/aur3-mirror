# Maintainer: David Mikalova <superfuzzykittens at gmail dot com>
pkgname=brocket
pkgver=1.0
pkgrel=3
pkgdesc="A program launcher that attempts to prevent multiple instances."
arch=('any')
url="https://github.com/superfuzzykittens/brocket"
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
md5sums=('e62dc434434584be08545a3e2181fe91')

build() {
  install -Dm 755 $srcdir/brocket ${pkgdir}/usr/bin/brocket
}