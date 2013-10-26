# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=scrawl
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('custom:WTFPL' 'custom:OFL')
depends=('vapoursynth')
source=("https://github.com/dubhater/vapoursynth-${_plug}/archive/v${pkgver}.tar.gz"
        'COPYING::http://www.wtfpl.net/txt/copying/')
md5sums=('7e4cb7b029207a9176b23eb866864969'
         '8365d07beeb5f39d87e846dca3ae7b64')

prepare() {
  rm -fr build
  cp -R "vapoursynth-${_plug}-${pkgver}" build
}

build() {
  cd build
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd build
  make install DESTDIR="$pkgdir"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"

  install -Dm644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ofl.txt "${pkgdir}/usr/share/licenses/${pkgname}/ofl.txt"
}
