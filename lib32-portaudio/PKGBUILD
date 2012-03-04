# Maintainer: josephgbr <rafael.f.f1 at gmail.com>
# Contributor: Xavius <xavierelf at gmail.com>

_pkgbase=portaudio
pkgname=lib32-${_pkgbase}
pkgver=19_20111121
pkgrel=1
pkgdesc='A free, cross-platform, open source, audio I/O library. (32 bit)'
arch=('x86_64')
url="http://www.portaudio.com/"
license=('custom')
depends=('lib32-jack' 'lib32-alsa-lib' ${_pkgbase})
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://www.portaudio.com/archives/pa_stable_v$pkgver.tgz")
md5sums=('25c85c1cc5e9e657486cbc299c6c035a')

build() {
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd "${srcdir}/${_pkgbase}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package () {
  cd "${srcdir}/${_pkgbase}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/include"
  install -d "${pkgdir}/usr/share/licenses/"
  ln -s ${_pkgbase} "${pkgdir}/usr/share/licenses/${pkgname}"
}
