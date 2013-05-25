# $Id$
# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_cmakename=cmake
_cmakever=2.8.10.20130511-g7b545
pkgname=cmake-unstable
pkgver=2.8.10.20130511
pkgrel=1
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt5-base' 'emacs')
optdepends=('qt5-base: cmake-gui')
provides=('cmake')
conflicts=('cmake')
install="${_cmakename}.install"
source=("http://www.cmake.org/files/vCVS/${_cmakename}-${_cmakever}.tar.gz"
        'qt4.patch')
md5sums=('2f7744c693053b249c9a02cdec57b6b2'
         '5d6c9e4bf3bbcdaef4a605d03f71850f')

build() {
  cd ${_cmakename}-${_cmakever}

  # qmake refers to Qt5
  patch -p1 -i "${srcdir}"/qt4.patch

  # Qt is built with reduce-relocations
  export CFLAGS="${CFLAGS} -fPIC"
  export CXXFLAGS="${CXXFLAGS} -fPIC"

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${_cmakename}-${_cmakever}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Docs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${_cmakename}/LICENSE
}
