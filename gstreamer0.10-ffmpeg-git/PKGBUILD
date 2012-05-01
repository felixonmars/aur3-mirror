# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=gstreamer0.10-ffmpeg-git
pkgver=20120501
pkgrel=1
pkgdesc="Gstreamer FFMpeg Plugin git version"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gstreamer0.10-base-git' 'bzip2')
makedepends=('pkgconfig' 'yasm' 'sdl')
conflicts=('gstreamer0.10-ffmpeg')
provides=('gstreamer0.10-ffmpeg=0.10.13')
url="http://www.gstreamer.net"
groups=('gstreamer0.10-plugins')
options=('!libtool')

_gitname=gst-ffmpeg
_gitroot=git://anongit.freedesktop.org/gstreamer/${_gitname}


build() {
  cd "${srcdir}"

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull && cd ..
  else
    git clone "${_gitroot}" && cd ${_gitname}
    git checkout 0.10 && cd ..
  fi

  rm -rf build
  cp -r ${_gitname} build
  cd build

  unset CFLAGS
  unset CXXFLAGS
  ./autogen.sh --noconfigure 
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --with-ffmpeg-extra-configure="--enable-runtime-cpudetect"

  make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
