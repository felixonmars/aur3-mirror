# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ffms2
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/FFMS/ffms2"
license=('MIT')
depends=('vapoursynth' 'ffms2-git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
replaces=('vapoursynth-plugin-ffmpegsource-git')

package(){
  mkdir -p "${pkgdir}/usr/lib/vapoursynth"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/lib/libffms2.so "${pkgdir}/usr/lib/vapoursynth/libffms2.so"
  ln -s /usr/share/licenses/ffms2-git/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
