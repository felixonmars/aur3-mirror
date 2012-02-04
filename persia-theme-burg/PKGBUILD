# Maintainer: fzerorubigd <me@cyberrabbits.net>

pkgname=persia-theme-burg
pkgver=0.1
pkgrel=3
pkgdesc="Extra Theme for Burg Bootloader"
arch=('any')
url="http://cyberrabbits.net"
license=('GPL')
depends=('burg')
makedepends=('unzip')
conflicts=(persia-theme-burg-fixed)

source=('http://dl.dropbox.com/u/17051717/pkg/persia.zip')
md5sums=('b6a4872db1f20683b6eaa2beeb111c1e'
           )
install='burg-themes.install'

build() {
  #msg Testing stuff ...
  #return 1
  mkdir -p $pkgdir/boot/burg/themes
  # install theme
  cp -rip $srcdir/persia $pkgdir/boot/burg/themes
}


