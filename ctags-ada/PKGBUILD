# Maintainer: Chaoswizard <chaoswizard@gmail.com>

pkgname=ctags-ada
pkgver=5.7
pkgrel=1
pkgdesc="Ctags patched with Ada Programing Language Support"
url="http://gnuada.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('vim')
conflicts=('ctags')
source=("http://downloads.sourceforge.net/sourceforge/ctags/ctags-${pkgver}.tar.gz"
"http://heanet.dl.sourceforge.net/project/gnuada/Tools%20Source/R8/ctags-ada-mode-4.3.11.tar.bz2")
md5sums=('643cab63b39c8a24377dc4c781547d40'
'e7faddb363713802172f6b56797d7773')

build() {
  cd ${srcdir}/ctags-${pkgver}
  cp ../ctags-ada-mode-4.3.11/ada.c .
  cp ../ctags-ada-mode-4.3.11/add_ada.vim .
  ./configure --prefix=/usr
  vim add_ada.vim -c ":so %" -c ":q"
  make
}

package() {
  cd ${srcdir}/ctags-${pkgver}
  make prefix=${pkgdir}/usr install
}
