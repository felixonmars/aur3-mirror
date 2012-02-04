# Contributor: Andru <dr.andru@gmail.com>

pkgname=diamond-fighters
pkgver=0.9.5
pkgrel=3
pkgdesc='2D Tank Arcade.'
arch=('i686' 'x86_64')
url="http://andru-kun.inf.ua/games/df.html"
license=('GPL2')
depends=('libgl' 'mesa' 'openal' 'libmodplug')
makedepends=('fpc>=2.4')
source=(http://andru-kun.inf.ua/games/df/$pkgname-linux-$pkgver.tar.bz2 \
        http://andru-kun.inf.ua/games/df/$pkgname-src-$pkgver.tar.bz2 \
        http://andru-kun.inf.ua/games/df/diamond-fighters.patch \
        http://zengl.org/zengl/zengl-src-0.2.4.tar.bz2)

md5sums=('00e3fb8cd87caccdf64a9a702a1b200e'
         '611222b9c473eb02bc9426f559b61498'
         '736c832d750d4e16cdaeacecf1035f66'
         'a007f99a9784812afe11b1b4d34cd0e2')

build() {
  cd "$srcdir"

  patch -p0 < diamond-fighters.patch

  cd $pkgname-src-$pkgver

  cp -R ../$pkgname-linux-$pkgver/* ./build
  cp -R ../zengl-src-0.2.4/* src/ZenGL
  make || return 1
  mkdir -p "$pkgdir"/usr/{bin,{share/pixmaps,share/applications}}
  make DESTDIR="$pkgdir"/usr install
}
