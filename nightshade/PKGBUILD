# Maintainer: archtux <antonio.arias99999 at gmail.com>

pkgname=nightshade
pkgver=11.7.1
pkgrel=3
pkgdesc="Astronomy Simulator"
arch=('i686' 'x86_64')
url="http://nightshadesoftware.org/"
license=('GPL3')
depends=('graphicsmagick' 'libjpeg' 'libpng' 'sdl_mixer' 'sdl_pango')
makedepends=('boost' 'fastdb')
source=(http://nightshadesoftware.org/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('cd278e56510b1c5531ca32ca2ba43360')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install

  # Desktop icon
  install -Dm644 data/icon.bmp $pkgdir/usr/share/pixmaps/nightshade.bmp
  install -Dm644 $startdir/nightshade.desktop $pkgdir/usr/share/applications/nightshade.desktop
}