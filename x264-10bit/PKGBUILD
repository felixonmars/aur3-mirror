# AUR Package Author: PelPix <kylebloss@pelpix.info>
# Contributor:  Ionut Biru <ibiru@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <nospam@bpiotrowski.pl>
# Contributor: damir <damir@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>

pkgname=x264-10bit
_gitname=x264
pkgver=142.20140311
pkgrel=1
epoch=1
pkgdesc='Library for encoding H264/AVC video streams'
arch=('i686' 'x86_64')
url='http://www.videolan.org/developers/x264.html'
license=('GPL')
depends=('glibc')
makedepends=('yasm' 'git')
source=(git://git.videolan.org/x264.git#commit=aff928d2)
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

build() {
  cd $_gitname

  ./configure --prefix=/usr \
    --bit-depth=10
  
  make
}

package() {
  make -C $_gitname DESTDIR="$pkgdir" install
  mv $pkgdir/usr/bin/x264 $pkgdir/usr/bin/x264-10bit

}
