# Maintainer: Whitie

pkgname=x264-ffms-git
_gitname="x264"
pkgver=0.r2525.40bb568
pkgrel=1
pkgdesc="H.264 video encoder and library with ffms enabled (static build)."
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
makedepends=('git' 'yasm' 'ffms2')
url="http://www.videolan.org/developers/x264.html"
source=('git://git.videolan.org/x264.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname

  ./configure --enable-static --enable-pic
  make
}

package() {
  cd $_gitname

  mkdir -p $pkgdir/usr/bin
  cp ./x264 $pkgdir/usr/bin/x264-ffms
}