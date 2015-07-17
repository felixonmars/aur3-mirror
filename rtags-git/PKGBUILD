# Maintainer: John Schoenick <john@pointysoftware.net>

# _rtags_ver=commit=ab59ff04b05508494332fa88476efdb4b3534671
_rtags_ver=branch=master
# _rtags_ver=branch=file

pkgname=rtags-git
pkgver=2.0.312.g5109854
pkgrel=1
pkgdesc='RTags is a client/server application that indexes C/C++ code and keeps a persistent in-memory database of references, declarations, definitions, symbolnames etc.'
arch=('i686' 'x86_64')
url='https://github.com/Andersbakken/rtags'
license=('GPL3')
makedepends=('git' 'cmake' 'emacs')
provides=("rtags=${pkgver}")
conflicts=('rtags')
depends=('bash' 'openssl' 'clang')

source=("git+https://github.com/Andersbakken/rtags#${_rtags_ver}"
        "rtags-rct::git+https://github.com/Andersbakken/rct")
sha1sums=('SKIP'
          'SKIP')

options+=('debug')

pkgver() {
  cd "${srcdir}"/rtags
  local ver="$(git describe --tags)"
  ver="${ver//-/.}"
  echo "${ver#v}"
}

prepare() {
  cd "${srcdir}/rtags"
  git config submodule.src/rct.url "${srcdir}"/rtags-rct
  git submodule update --init src/rct
}

build() {
  cd "${srcdir}"

  # Nuke old build dirs
  rm -rf build elisp
  mkdir build elisp

  cd build
  msg2 "Configuring with cmake"
  cmake "${srcdir}"/rtags -DCMAKE_INSTALL_PREFIX=/usr
  msg2 "Building"
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install

  # Misc wrapper/helper scripts not put in bin by make install go here
  install -d "${pkgdir}/usr/lib/rtags/bin"
  for misc in "${srcdir}"/build/bin/*; do
    if [[ ! -f "${pkgdir}/usr/bin/$(basename "$misc")" ]]; then
      install -D -m755 "$misc" "${pkgdir}"/usr/lib/rtags/bin
    fi
  done

  #
  msg2 "Byte-compiling installed elisp files"
  cd "${pkgdir}"/usr/share/emacs/site-lisp/rtags
  # FIXME the rtags plugins for auto-complete and company mode wont compile if
  #       you don't have them installed, and there are no arch packages for them
  #       currently. (bytecode compilation is not required, but provides a
  #       speedup)
  for elispSrc in *.el; do
    if ! emacs -batch -f batch-byte-compile "$elispSrc"; then
      warning "Failed to byte-compile $elispSrc"
    fi
  done
}
