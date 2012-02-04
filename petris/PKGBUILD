# Maintainer: Sam Harada <peasantoid at archlinux dot us>

pkgname=petris
pkgver=20100125
pkgrel=1
pkgdesc="tetris clone written in python"
arch=(any)
url="http://peasantoid.org/git/petris"
license=('GPL')
groups=()
depends=('python-pygame' 'sdl_ttf')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
options=()
install=
source=()
noextract=()
md5sums=()

build() {
  cd $srcdir
  if test -d petris; then
    cd petris
    git pull || return 1
  else
    git clone git://peasantoid.org/petris || return 1
    cd petris
  fi
  root=$pkgdir ./install.sh install || return 1
}
