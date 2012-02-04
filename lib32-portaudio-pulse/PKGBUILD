_pkgbasename=portaudio
pkgname=lib32-$_pkgbasename-pulse
pkgver=19_20110326
pkgrel=1
pkgdesc="A free, cross-platform, open source, audio I/O library (with pulse support, 32 bit)"
arch=('x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=('lib32-jack' 'lib32-alsa-lib' 'lib32-libpulse' "$_pkgbasename")
makedepends=('gcc-multilib')
conflicts=("lib32-$_pkgbasename")
provides=("lib32-$_pkgbasename")
options=('!libtool')
source=(http://www.portaudio.com/archives/pa_stable_v$pkgver.tgz)
md5sums=('8f266ce03638419ef46e4efcb0fabde6')

build() {
  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  cd "${srcdir}/${_pkgbasename}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package () {
  cd "${srcdir}/${_pkgbasename}"
  make DESTDIR=$pkgdir install
  rm -rf "${pkgdir}"/usr/include
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
