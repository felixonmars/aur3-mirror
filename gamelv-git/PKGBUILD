# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gamelv-git
pkgver=11.f07c461
pkgrel=1
pkgdesc="A point-and-click Adventure Game in Post Soviet Environment(only latvian speech)"
arch=('i686' 'x86_64')
url="https://github.com/snauts/GameLV"
license=('GPL2')
depends=('glu' 'sdl_image' 'sdl_mixer')
makedepends=('git')
conflicts=('gamelv' 'gamelv-engine-git')
source=('git+https://github.com/snauts/GameLV.git'
        gamelv
        gamelv.desktop)
md5sums=('SKIP'
         '2b15e5be8cb6b2e87882d74b12fcf74a'
         'd96531af9117e2da56e4d434b64871a5')

pkgver() {
  cd $srcdir/GameLV/source
  echo $(git rev-list --count master).$(git rev-parse --short master)
}         
        
prepare() {
  cd $srcdir/GameLV/source
  sed -i 's|-lGLU|-lGLU -lGL|' Makefile
}

build() {
  cd $srcdir/GameLV/source
  make
}

package() {
  cd $srcdir/GameLV/source
  # Uncomment next line for speech(only latvian)
  # sed "s/\-en//" *.lst -i

  # Binary
  install -Dm755 game-lv $pkgdir/usr/share/games/gamelv/game-lv
  
  # Data
  cp -r ../data $pkgdir/usr/share/games/gamelv

  # Desktop icon
  install -Dm644 ../data/icon.bmp $pkgdir/usr/share/pixmaps/gamelv.bmp
  cd $srcdir
  install -Dm644 gamelv.desktop $pkgdir/usr/share/applications/gamelv.desktop

  # Start file
  install -Dm755 gamelv $pkgdir/usr/bin/gamelv
}