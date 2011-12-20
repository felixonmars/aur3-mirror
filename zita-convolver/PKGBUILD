# Maintainer : Philipp Überbacher <murks at lavabit dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: orbisvicis
pkgname=zita-convolver
pkgver=3.1.0
pkgrel=1
pkgdesc="Convolution library for aeolus and jconvolver"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio"
license=('GPL')
depends=('fftw' 'gcc-libs')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/zita-convolver-$pkgver.tar.bz2")
md5sums=('7e264d0fb0d8ea277cdb4e33d764c68a')

build() {
  cd "$srcdir/zita-convolver-$pkgver/libs"

  sed -i 's/usr\/local/usr/' Makefile
  sed -i 's/ldconfig//' Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/libs"

  make SUFFIX="" PREFIX="$pkgdir/usr" DESTDIR=${PKGDIR} install 


  # Another failed attempt at trying to be clever. A simple call to ldconfig might have worked.
  #  ln -s lib$pkgname.so.$pkgver \
  #    "$pkgdir/usr/lib/lib$pkgname.so.${pkgver%%.*}"
  
  #  ln -s lib${pkgname}.so.$pkgver ${pkgdir}/usr/lib/lib${pkgname}.so
}


