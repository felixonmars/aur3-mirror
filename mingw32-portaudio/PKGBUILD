# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=mingw32-portaudio
pkgver=19_20071207
pkgrel=1
pkgdesc="A free, cross-platform, open source, audio I/O library (mingw32)"
arch=('i686')
url="http://www.portaudio.com/"
license=('GPL')
makedepends=('mingw32-gcc' 'patch' 'autoconf' 'libtool')
source=(http://www.portaudio.com/archives/pa_stable_v${pkgver}.tar.gz fix-mingw32.patch)
md5sums=('d2943e4469834b25afe62cc51adc025f'
         '2c7cf0bf5a3c5368751a9c4dc1b66cec')

build() {
  cd "$srcdir/portaudio"
  patch -p1 < "$srcdir/fix-mingw32.patch"

  autoreconf -fiv

  ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install || return 1
}

# vim:set ts=2 sw=2 et:
