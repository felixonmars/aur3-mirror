# Maintainer: Никола Вукосављевић <hauzer@gmx.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=cmake
pkgname=${_pkgname}-findwxwidgets-patch
pkgver=2.8.12
pkgrel=1
pkgdesc="A cross-platform open-source make system"
arch=('i686' 'x86_64')
url="http://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'shared-mime-info')
makedepends=('qt4' 'emacs')
optdepends=('qt4: cmake-gui')
conflicts=('cmake' 'cmake-git')
provides=('cmake')
install="${_pkgname}.install"
source=("http://www.cmake.org/files/v2.8/${_pkgname}-${pkgver}.tar.gz"
        'find_wxwidgets.patch')
md5sums=('105bc6d21cc2e9b6aff901e43c53afea'
         '23cedf85ee98efe8c337250911026161')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    # http://public.kitware.com/Bug/view.php?id=11296
    patch -p1 -i "${srcdir}/find_wxwidgets.patch"
}

build() {
  cd ${_pkgname}-${pkgver}

  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  vimpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 Docs/cmake-indent.vim "${vimpath}"/indent/cmake-indent.vim
  install -Dm644 Docs/cmake-syntax.vim "${vimpath}"/syntax/cmake-syntax.vim

  install -Dm644 Docs/cmake-mode.el \
    "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el

  install -Dm644 Copyright.txt \
    "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}

