# Maintainer:  Serus

pkgname=('x264-tmod')
pkgver=142.20140711
pkgrel=1
epoch=2
arch=('i686' 'x86_64')
url='https://github.com/astrataro/x264_tMod/'
license=('GPL')
depends=('glibc' 'l-smash-tmod')
makedepends=('yasm' 'git' 'ffmpeg')
source=(git://github.com/astrataro/x264_tMod.git#commit=37160de)
md5sums=('SKIP')

pkgver() {
  cd x264_tMod
  local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
  local _date=$(git log -1 --format="%cd" --date=short | tr -d -)

  echo ${_ver}.${_date}
}

prepare() {
  cp -r x264_tMod x264_tMod-10bit
}

build() {
  cd x264_tMod
  ./configure --prefix=/usr
  make

  cd ../x264_tMod-10bit
  ./configure --prefix=/usr \
    --bit-depth=10
  make
}

package_x264-tmod() {
  pkgdesc="CLI tools for encoding H264/AVC video streams with JEEB's patchsets"
  depends=('glibc' 'ffmpeg')
  provides=('x264-10bit')
  conflicts=('x264-10bit')
  replaces=('x264-10bit')

  make -C x264_tMod DESTDIR="$pkgdir" install-cli
  install -Dm755 x264_tMod-10bit/x264 "$pkgdir"/usr/bin/x264-10bit
}