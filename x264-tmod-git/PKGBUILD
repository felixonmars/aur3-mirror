# Maintainer: Felix Yan <felixonmars[at]gmail[dot]com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>
# Contributor: zhuqin <zhuqin83[at]gmail[dot]com>
# Contributor: pressh <pressh[at]gmail[dot]com>

pkgname=x264-tmod-git
_gitname="x264_tMod"
pkgver=3104.0158519
pkgrel=1
pkgdesc="H.264/MPEG-4 AVC video encoder with JEEB's patchsets"
arch=('i686' 'x86_64')
url="https://github.com/astrataro/x264_tMod"
license=('GPL')
depends=('glibc' 'ffmpeg' 'l-smash-tmod-git')
makedepends=('yasm' 'git')
conflicts=('x264')
provides=("x264=$(LANG=C pacman -Si x264 | grep Version | awk '{ print $NF }')") 
source=("git://github.com/astrataro/$_gitname.git#branch=tMod")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

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
