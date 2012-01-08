# Maintainer: trya <tryagainprod@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

_pkgbasename=portaudio_cpp
pkgname=lib32-portaudio_cpp
pkgver=19_20110326
pkgrel=1
pkgdesc="PortAudio c++ bindings (32-bit)"
arch=('x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=("portaudio=${pkgver}" 'gcc-libs')
options=('!libtool')
source=(http://www.portaudio.com/archives/pa_stable_v$pkgver.tgz)
md5sums=('8f266ce03638419ef46e4efcb0fabde6')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/portaudio"
  ./configure --prefix=/usr --libdir=/usr/lib32 --enable-cxx
  make
}

package() {
  cd "$srcdir/portaudio/bindings/cpp"
  make DESTDIR="$pkgdir" install
  install -D -m644 ../../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  rm -rf "$pkgdir/usr/include"
}

