
pkgname=vorbis-tools-aotuv
_pkgname=vorbis-tools
pkgver=1.4.0
pkgrel=1
pkgdesc="Extra tools for Ogg-Vorbis (use lubvorbis-aotuv)"
arch=('i686' 'x86_64')
url='http://www.xiph.org/vorbis/'
provides=('vorbis-tools=1.4.0')
conflicts=('vorbis-tools')
license=('GPL2')
depends=('libao' 'libvorbis-aotuv' 'curl' 'flac')
source=("http://downloads.xiph.org/releases/vorbis/${_pkgname}-${pkgver}.tar.gz")
md5sums=('567e0fb8d321b2cd7124f8208b8b90e6')

prepare() {
  rm -fr build
  cp -R "${_pkgname}-${pkgver}" build
}

build() {
  cd build
  ./configure --prefix=/usr \
    --without-speex \
    --enable-vcut
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
