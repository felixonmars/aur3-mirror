# Maintainer: Kyle Bloss <kylebloss[at]pelpix[dot]info>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=ffmbc
pkgver="0.7.2"
pkgrel=1
pkgdesc="FFmpeg customized for broadcast and professional usage"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ffmbc/"
license=('GPL2' 'custom')
depends=('faac' 'lame' 'libass' 'x264-git' 'zlib')
makedepends=('yasm')
source=('https://docs.google.com/uc?export=download&id=0B0jxxycBojSwTEgtbjRZMXBJREU')
sha1sums=('48caa6078c649e641d89d48ba31dcaef4e9ae02a')

build() {
  cd "${srcdir}/FFmbc-${pkgver//_/-}"

  ./configure \
    --prefix=/usr \
    --incdir=/usr/include/ffmbc \
    --libdir=/usr/lib/ffmbc \
    --shlibdir=/usr/lib/ffmbc \
    --extra-libs=-ldl \
    --disable-ffprobe \
    --enable-gpl \
    --enable-libass \
    --enable-libfaac \
    --enable-libmp3lame \
    --enable-libx264 \
    --enable-nonfree 

  make -i doc/ffmbc.1
#  make doc/ffmbc.1
  make
}

package() {
  cd "${srcdir}/FFmbc-${pkgver//_/-}"
  make DESTDIR="${pkgdir}" install install-man

}
