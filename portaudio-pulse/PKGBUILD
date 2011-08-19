_pkgbasename=portaudio
pkgname=$_pkgbasename-pulse
pkgver=19_20110326
pkgrel=1
pkgdesc="A free, cross-platform, open source, audio I/O library (with pulse support)"
arch=('i686' 'x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=('jack-audio-connection-kit' 'libpulse')
conflicts=("$_pkgbasename")
provides=("$_pkgbasename")
options=('!libtool')
source=(http://www.portaudio.com/archives/pa_stable_v$pkgver.tgz)
md5sums=('8f266ce03638419ef46e4efcb0fabde6')

build() {
  cd "${srcdir}/${_pkgbasename}"
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${_pkgbasename}"
  make DESTDIR=$pkgdir install

  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
