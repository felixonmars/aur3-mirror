# Contributor: wielokropek <wielokropek@gmail.com>
pkgname=kb3700_fanctrl
pkgver=1
pkgrel=1
pkgdesc="Tool to control the Fan speed on MSI Wind Netbooks (and its clones)."
arch=('i686' 'x68_64')
url="http://sites.google.com/site/jonasdiemer/Home/kb3700_fanctrl"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://sites.google.com/site/jonasdiemer/Home/kb3700_fanctrl/kb3700_fanctrl.c)
noextract=()
md5sums=('f3f37ff203e285e966be99c49ceb0445')

build() {
  mkdir -p $pkgdir/usr/bin
  cc kb3700_fanctrl.c -o $pkgdir/usr/bin/kb3700_fanctrl
}

# vim:set ts=2 sw=2 et:
