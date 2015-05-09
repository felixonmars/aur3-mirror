# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=sdlmamefamily-tools
pkgver="0.161"
pkgrel=1
pkgrel=1
pkgdesc="Tools for manage MAME/MESS/UME roms"
url="http://mamedev.org/"
license=('custom:MAME License')
arch=('i686' 'x86_64')
depends=('sdl2')
conflicts=('sdlmame' 'sdlmess' 'sdlume')
makedepends=('nasm' 'mesa' 'glu' 'wget' 'python2')
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz")
sha1sums=('5ae85a734b986c70dfcec1bcf1046d8ef7f8e348')

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
       TOOLS=1 \
       STRIP_SYMBOLS=1 \
       TARGET=mame
  make PYTHON_EXECUTABLE=/usr/bin/python2 \
       PTR64="${_set_64}" \
       SSE2="${_set_64}" \
       OPTIMIZE=2 \
       NOWERROR=1 \
       USE_OPENGL=1 \
       USE_QTDEBUG=0 \
       TOOLS=1 \
       STRIP_SYMBOLS=1 \
       TARGET=mess
  make PYTHON_EXECUTABLE=/usr/bin/python2 \
       PTR64="${_set_64}" \
       SSE2="${_set_64}" \
       OPTIMIZE=2 \
       NOWERROR=1 \
       USE_OPENGL=1 \
       USE_QTDEBUG=0 \
       TOOLS=1 \
       STRIP_SYMBOLS=1 \
       TARGET=ume
}

package() {
  cd "mame-mame${pkgver/./}"

  # Install the applications
  install -Dm755 castool    "${pkgdir}/usr/bin/castool"
  install -Dm755 chdman     "${pkgdir}/usr/bin/chdman"
  install -Dm755 floptool   "${pkgdir}/usr/bin/floptool"
  install -Dm755 imgtool    "${pkgdir}/usr/bin/imgtool"
  install -Dm755 jedutil    "${pkgdir}/usr/bin/jedutil"
  install -Dm755 ldresample "${pkgdir}/usr/bin/ldresample"
  install -Dm755 ldverify   "${pkgdir}/usr/bin/ldverify"
  install -Dm755 nltool     "${pkgdir}/usr/bin/nltool"
  install -Dm755 pngcmp     "${pkgdir}/usr/bin/pngrep"
  install -Dm755 regrep     "${pkgdir}/usr/bin/regrep"
  install -Dm755 romcmp     "${pkgdir}/usr/bin/romcmp"
  install -Dm755 split      "${pkgdir}/usr/bin/splitmamerom"
  install -Dm755 src2html   "${pkgdir}/usr/bin/src2html"
  install -Dm755 srcclean   "${pkgdir}/usr/bin/srcclean"
  install -Dm755 testkeys   "${pkgdir}/usr/bin/testkeys"
  install -Dm755 unidasm    "${pkgdir}/usr/bin/unidasm"

  # Install the extra bits
  install -d "${pkgdir}/usr/share/man/man1"
  install -m644 src/osd/sdl/man/*.1* "${pkgdir}/usr/share/man/man1/"

  find "${pkgdir}"/usr/bin -type f -exec strip "{}" \;

  # The license
  install -Dm644 docs/license.txt "${pkgdir}/usr/share/licenses/custom/${pkgname}/license.txt"
}
