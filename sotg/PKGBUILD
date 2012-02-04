# Contributor: rabyte <rabyte*gmail>
# Contributor: Andru  <dr.andru@gmail.com>

pkgname=sotg
pkgver=1.0.4
pkgrel=4
pkgdesc='"Stones of the Gods" is a match-3-like game'
arch=('i686' 'x86_64')
url="http://andru-kun.inf.ua/games/sotg.html"
license=('GPL2')
depends=('libgl' 'mesa' 'openal' 'libmodplug')
makedepends=('fpc>=2.4')
source=(http://andru-kun.inf.ua/games/sotg/$pkgname-linux-$pkgver.tar.bz2 \
        http://andru-kun.inf.ua/games/sotg/$pkgname-src-$pkgver.tar.bz2 \
        http://andru-kun.inf.ua/games/sotg/sotg.patch \
        http://zengl.org/zengl/zengl-src-0.2.4.tar.bz2)

md5sums=('2c2241ed6d1d6bed269e51c18ff8799b'
         'fec83a64ad9779b4a0ce740d8a4a4155'
         '13836a2178004e3b5399244bb952ff12'
         'a007f99a9784812afe11b1b4d34cd0e2')

build() {
  cd "$srcdir"

  patch -p0 < sotg.patch

  cd "$srcdir"/sotg-src-$pkgver

  cp -R ../sotg-linux-$pkgver/* ./build
  mv ../zengl-src-0.2.4 src/ZenGL
  make || return 1
  mkdir -p "$pkgdir"/usr/{bin,{share/pixmaps,share/applications}}
  make DESTDIR="$pkgdir"/usr install
}
