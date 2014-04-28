# Maintainer:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=caudio-git
pkgver=2.3.0.r237.9dabaaa
pkgrel=1
pkgdesc="advanced C++ wrapper around OpenAL"
arch=('i686' 'x86_64')
url="https://github.com/wildicv/cAudio"
license=('zlib')
depends=('openal')
makedepends=('git' 'cmake')
provides=('caudio')
conflicts=('caudio')

_gitname=cAudio
source=("git+https://github.com/prettyv/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  local rel=`grep "^PROJECT_NUMBER" Doxyfile | cut -d "=" -f 2 | tr -d " "`
  printf "%s.r%s" "${rel}" "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"

  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCAUDIO_BUILD_EAX_PLUGIN=ON \
        -DCAUDIO_BUILD_MP3DECODER_PLUGIN=ON \
        -DCAUDIO_BUILD_SAMPLES=OFF \
        -DCAUDIO_DEPENDENCIES_DIR=Dependencies64

  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"

  install License.txt -Dm644 ${pkgdir}/usr/share/licenses/$_pkgname/License.txt
}
