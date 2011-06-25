# Mantainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=xavs-svn
pkgver=51
pkgrel=1
pkgdesc="AVS is the Audio Video Standard of China.  This project aims to implement high quality AVS encoder and decoder. (SVN version)"
url="http://xavs.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=()
makedepends=('gcc')

_svntrunk=https://xavs.svn.sourceforge.net/svnroot/xavs
_svnmod=trunk

build() {
  svn co ${_svntrunk}/${_svnmod}

  cd ${_svnmod}
  ./configure --enable-shared --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_svnmod}
  make DESTDIR="${pkgdir}" install
}
