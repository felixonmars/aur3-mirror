# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Based on: Anton Shestakov <engored*ya.ru>

pkgname=sdlume-wout-toolkits
pkgver="0.161"
pkgrel=1
pkgdesc="Universal Machine Emulator combines the features of MAME and MESS into a single multi-purpose emulator. Without toolkits (gtk and qt)"
url='http://mamedev.emulab.it/haze/'
license=('custom:MAME License')
arch=('i686' 'x86_64')
conflicts=('sdlume')
depends=('sdl2_ttf' 'alsa-lib')
makedepends=('nasm' 'mesa' 'glu' 'wget' 'python2')
optdepends=('sdlmamefamily-tools: Tools for manage MAME/MESS/UME roms')
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz"
        "sdlume.sh")
sha1sums=('5ae85a734b986c70dfcec1bcf1046d8ef7f8e348'
          'e0521878c21a9d8369cab1e4b22fc0300b84b082')
install="sdlume.install"

prepare() {
  cd "mame-mame${pkgver/./}"

  find . -type f -not -name "*.png" -exec perl -pi -e 's|\r\n?|\n|g' "{}" \;
}

build() {
  cd "mame-mame${pkgver/./}"

  [ "${CARCH}" = "i686" ] && _set_64=0
  [ "${CARCH}" = "x86_64" ] && _set_64=1

  make PYTHON_EXECUTABLE=/usr/bin/python2 \
       PTR64="${_set_64}" \
       SSE2="${_set_64}" \
       OPTIMIZE=2 \
       NOWERROR=1 \
       USE_OPENGL=1 \
       USE_QTDEBUG=0 \
       TOOLS=0 \
       STRIP_SYMBOLS=1 \
       TARGET=ume
}

package() {
  cd "mame-mame${pkgver/./}"

  # Installing the wrapper script
  install -Dm755 ../sdlume.sh "${pkgdir}/usr/bin/sdlume"

  [ "${CARCH}" = "i686" ] && _suffix=""
  [ "${CARCH}" = "x86_64" ] && _suffix="64"
  # Install the applications and the UI font in /usr/share
  install -Dm755 "ume${_suffix}" "${pkgdir}/usr/share/sdlume/sdlume"

  # Installing extra bits
  install -d "${pkgdir}/usr/share/sdlume/"{artwork,hash,shader,keymaps}
  install -m644 artwork/* "${pkgdir}/usr/share/sdlume/artwork/"
  install -m644 hash/* "${pkgdir}/usr/share/sdlume/hash/"
  install -m644 src/osd/modules/opengl/shader/glsl*.*h "${pkgdir}/usr/share/sdlume/shader/"
  install -m644 src/osd/sdl/keymaps/* "${pkgdir}/usr/share/sdlume/keymaps/"

  # The license
  install -Dm644 docs/license.txt "${pkgdir}/usr/share/licenses/custom/${pkgname}/license.txt"

  # documentation
  cd docs
  for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"; done
}
