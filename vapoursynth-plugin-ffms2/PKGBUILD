# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ffms2
pkgname=vapoursynth-plugin-${_plug}
pkgver=1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url="https://github.com/FFMS/ffms2"
license=('MIT')
depends=('vapoursynth' 'ffms2')
conflicts=("vapoursynth-plugin-${_plug}-git")

package(){
  mkdir -p "${pkgdir}/usr/lib/vapoursynth"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/vapoursynth/libffms2.so"
  ln -s /usr/share/licenses/ffms2/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
