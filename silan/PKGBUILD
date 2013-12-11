# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=silan
pkgver=0.3.2
pkgrel=1
pkgdesc="An audio file silence analyzer"
arch=('i686' 'x86_64')
url="https://github.com/x42/silan"
license=('GPL')
depends=('ffmpeg')
makedepends=('ffmpeg-compat')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('2eb87b44732d2dcf6cc3e26b2105946b')

build() {
  cd silan-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr
  make CFLAGS+=" -I/usr/include/ffmpeg-compat"
}

package() {
  cd silan-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
