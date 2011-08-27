# Maintainer: Scott Garrett <Wintervenom@gmail.com>
# Contributor: Scott Garrett <Wintervenom@gmail.com>

pkgname=dmpc
pkgver=0.2.3
pkgrel=3
pkgdesc="A Dmenu-based MPC client with a playlist manager and state-saving on playlist changes."
url="http://wintervenom.mine.nu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dmenu' 'mpc')
optdepends=('exo')
md5sums=('07e944ecac4efd501244162c19642d9c')
source=(
    'dmpc'
)

build() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/bin || return 1
  install -m755 $srcdir/dmpc $pkgdir/usr/bin/dmpc || return 1

  return 0
}
