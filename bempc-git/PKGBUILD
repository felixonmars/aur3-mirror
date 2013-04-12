# Maintainer: Zom <zom[at]eevul[dot]org>
# Contributor: <thomas.luebking@gmail.com>
# Contributor: SanskritFritz (gmail)

pkgname=bempc-git
_gitname=be-mpc-code
pkgver=2013.02.05
pkgrel=1
pkgdesc="BE::MPC is a Qt4 client for MPD with some UI experiments"
arch=('i686' 'x86_64')
url="http://sourceforge.net/p/be-mpc/"
license=('GPL')
depends=('qt4' 'libmpdclient')
makedepends=('git')
install='bempc.install'
source=("$_gitname::git://git.code.sf.net/p/be-mpc/code")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd ${srcdir}/${_gitname}
  qmake-qt4
  sed -ie 's/update-desktop-database//g' Makefile
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make INSTALL_ROOT=${pkgdir} install
}
