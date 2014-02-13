# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: miga@migalin.net

pkgname=sdl_draw
pkgver=1.2.13
pkgrel=1
pkgdesc="A basic primitive drawing library based on SDL (Simple DirectMedia Layer)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sdl-draw/"
license=('GPL' 'LGPL')
depends=('sdl')
source=("http://downloads.sourceforge.net/project/sdl-draw/SDL_draw/$pkgver/SDL_draw-$pkgver.tar.gz")
md5sums=('3f3e6985217e98d92cf5900a5d9f6444')
options=('libtool' 'staticlibs')

build() {
  cd SDL_draw-$pkgver

  ./configure --prefix=/usr --includedir=/usr/include/SDL
  make
}

package() {
  cd SDL_draw-$pkgver

  make prefix="$pkgdir"/usr mandir="$pkgdir"/usr/share/man install
  install -Dm644 include/SDL_draw.h "$pkgdir"/usr/include/SDL/SDL_draw.h
}
