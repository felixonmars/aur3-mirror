# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cmake-dev
_pkgname=cmake
pkgver=2.8.12rc2
_pkgver=2.8.12-rc2
pkgrel=1
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt4' 'emacs')
optdepends=('qt4: cmake-gui')
install="${pkgname}.install"
conflicts=('cmake')
provides=('cmake')
source=("http://www.cmake.org/files/v2.8/${_pkgname}-${_pkgver}.tar.gz")
md5sums=('1b3e9891952de1d54c187991ec2d829b')

build() {
  cd ${_pkgname}-${_pkgver}

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${_pkgname}-${_pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Docs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
