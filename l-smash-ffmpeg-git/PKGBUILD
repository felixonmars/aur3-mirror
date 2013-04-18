# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=l-smash-ffmpeg-git
pkgver=20130403.9e7d713
pkgrel=1
pkgdesc="MP4 muxer and other tools (with static ffmpeg libs form GIT) (GIT version)"
arch=('i686' 'x86_64')
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('l-smash')
conflicts=('l-smash')
url="http://code.google.com/p/l-smash/"

source=('git+https://code.google.com/p/l-smash/'
        'git://source.ffmpeg.org/ffmpeg.git')
md5sums=('SKIP'
         'SKIP')
_gitname="l-smash"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare () {
  rm -fr "${srcdir}/build"
}

build() {
  cd "${srcdir}/ffmpeg"
  ./configure --prefix="${srcdir}/build" --enable-gpl --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,ff{play,probe,server},doc,vdpau} --enable-pic
  make
  make install

  cd "${srcdir}/${_gitname}"

  PKG_CONFIG_PATH="${srcdir}/build/lib/pkgconfig" ./configure --prefix=/usr --extra-cflags=-fPIC
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
