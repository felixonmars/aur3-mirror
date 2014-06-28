# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: attila589 <attila589 at gmail dot com>

pkgname=neonlights
pkgver=1.00
pkgrel=4
pkgdesc="A one-handed autofire arena shooter inspired by Robert Fearon's SYNSO2: Squid Harder"
arch=('i686' 'x86_64')
url="http://www.niallmoody.com/neonlights.htm"
license=('GPL')
depends=('sdl_image' 'sdl_ttf' 'portaudio' 'libvorbis' 'glew')
source=("http://downloads.niallmoody.com/NeonLights-$pkgver-src.tar.gz"
        "$pkgname.desktop")
sha256sums=('c76abd36fdb6a5058307e0754c6aac7913ce2984777cc29751d407263e716290'
            'c345ff8ec5ef2f8d9844aec856b2c289cbba8d50a64eb0605fb3d65c9b1e55fd')

build() {
  cd NeonLights-$pkgver

  # add libX11 to linker
  LIBS="$LIBS -lX11" ./configure --prefix=/usr
  make
}

package() {
  cd NeonLights-$pkgver

  make DESTDIR="$pkgdir" install
  # fix doc folder
  mv "$pkgdir"/usr/doc "$pkgdir"/usr/share/doc
  # desktop entry
  install -Dm644 icon/icon_48.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
