# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>

pkgname=beret-git
pkgver=r34.ga1ac69f
pkgrel=1
pkgdesc="2D puzzle platformer about a telekinetic scientist (development version)"
arch=('i686' 'x86_64')
url="http://kiwisauce.com/beret/"
license=('LGPL' 'OFL')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
makedepends=('git')
provides=('beret')
source=("git+https://git.gitorious.org/beret/beret.git"
        "beret.sh")
sha256sums=('SKIP'
            'a577d4c2c2b1329551cee1a9f43eb68eb7e1958a8b8d8bd43f6fc4c1c6b6ae10')

pkgver() {
  cd beret
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # fix SDL include dir, add libm to linker and add our cflags
  sed '1,5 s|SDL|&/SDL|' -i beret/*.c
  sed 's|-lSDL_mixer$|& -lm|;s|CFLAGS=|CFLAGS +=|' -i beret/Makefile
  #'s|LFLAGS=|LFLAGS = $LDFLAGS|' # this adds our ldflags, but breaks the build
}

build() {
  make -C beret
}

package() {
  cd beret

  # launcher + binary
  install -Dm755 ../beret.sh "$pkgdir"/usr/bin/beret
  install -Dm755 beret "$pkgdir"/opt/beret/beret
  # data files
  for _f in AveriaSans-Regular.ttf {images,music,rooms,sfx}/*; do
    install -Dm644 $_f "$pkgdir"/opt/beret/$_f
  done
  # readme + license
  install -Dm644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/OFL.txt 
}
