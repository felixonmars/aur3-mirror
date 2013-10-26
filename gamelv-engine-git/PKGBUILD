# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gamelv-engine-git
pkgver=11.f07c461
pkgrel=1
pkgdesc="Engine for GameLV"
arch=('i686' 'x86_64')
url="https://github.com/snauts/GameLV"
license=('GPL2')
depends=('glu' 'sdl_image' 'sdl_mixer')
makedepends=('git')
conflicts=('gamelv-git')
source=('git+https://github.com/snauts/GameLV.git')
md5sums=('SKIP')

prepare() {
  cd $srcdir/GameLV/source

  # Fix Makefile
  sed -i 's_-lGLU_-lGLU -lGL_' Makefile 
}
build() {
  cd $srcdir/GameLV/source
  make  
}

package() {
  cd $srcdir/GameLV/source
  install -Dm755 game-lv $pkgdir/usr/share/games/gamelv/game-lv
}

pkgver() {
  cd $srcdir/GameLV/source
  echo $(git rev-list --count master).$(git rev-parse --short master)
}