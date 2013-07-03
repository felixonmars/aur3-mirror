# Maintainer: Felix Yan <felixonmars[at]gmail[dot]com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
# Contributor: zhuqin <zhuqin83[at]gmail[dot]com>
# Contributor: pressh <pressh[at]gmail[dot]com>

pkgname=x264-jeeb
_gitname="x264_L-SMASH"
pkgver=2245
pkgrel=2
pkgdesc="H.264/MPEG-4 AVC video encoder with JEEB's patchsets"
arch=('i686' 'x86_64')
url="http://x264.fushizen.eu/"
license=('GPL')
depends=('glibc' 'ffmpeg' 'faac')
makedepends=('yasm' 'git')
conflicts=('x264')
provides=("x264=$(LANG=C pacman -Si x264 | grep Version | awk '{ print $NF }')") 
source=("git://github.com/jeeb/$_gitname.git#branch=r$pkgver")
md5sums=("SKIP")

build() {
  cd "$srcdir/$_gitname"

  ./configure \
    --prefix=/usr \
    --enable-nonfree \
    --enable-shared
  
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}
