# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)
# Contributor: Panagiotis Papadopoulos (pano_90 <at> gmx <dot> net)

pkgname=kwave
pkgver=0.8.99
pkgrel=2
pkgdesc="A sound editor for KDE"
arch=('i686' 'x86_64')
url="http://kwave.sourceforge.net/"
license=('GPL')
depends=('audiofile>=0.3.0' 'flac' 'fftw' 'kdelibs' 'libvorbis' 'libsamplerate' 'opus')
makedepends=('cmake' 'gettext' 'imagemagick' 'kdesdk-poxml' 'automoc4')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}-2.tar.bz2)
sha256sums=('94ad5d5d526714c5c496cf2f83d4e1aa34081997f574b465cd1972e5cba377f2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
  -DLIB_INSTALL_DIR=/usr/lib \
  -DCMAKE_BUILD_TYPE=Release \
  -DWITH_PULSEAUDIO=OFF \
  -DWITH_PHONON=OFF \
  -DWITH_MP3=OFF 
  #disable Phonon support, since it currently does not work, and only makes Kwave crash 
  #disable MP3 support, since it doesn't compile although dependency id3lib is installed
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
