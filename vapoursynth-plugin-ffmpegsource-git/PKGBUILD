# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ffmpegsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.18.0.ec0ef9c
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (build with static FFmpeg from GIT) (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/FFMS/ffms2"
license=('LGPL2.1')
depends=('vapoursynth')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
makedepends=('git' 'subversion')
options=('!libtool'
         '!emptydirs')
source=('ffmpegsource::git://github.com/FFMS/ffms2'
        'git://source.ffmpeg.org/ffmpeg.git')
md5sums=('SKIP'
         'SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(./version.sh)"."$(git describe --always)"
}

build() {
  cd "${srcdir}/ffmpeg"
  ./configure --prefix="${srcdir}/build" --disable-{network,{encod,mux}ers,hwaccels,{in,out}devs,debug,programs,doc,vdpau} --enable-pic --enable-avresample
  make
  make install

  cd "${srcdir}/${_gitname}"
  PKG_CONFIG_LIBDIR="${srcdir}/build/lib/pkgconfig" ./configure --enable-avresample --libdir=/usr/lib/vapoursynth/
  make
}

package(){
  cd "${srcdir}/${_gitname}"
  make DESTDIR="${pkgdir}" install
  find "${pkgdir}" ! -type d ! -name '*.so*' -delete
}
