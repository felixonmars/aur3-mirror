# Maintainer: Thomas Achtner <info@offtools.de>

pkgname=qlcplus-git
pkgver=20130505
pkgrel=1
pkgdesc="QLC+ is a fork of the great QLC project written by Heikki Junnila. This project aims to continue the development of QLC and to introduce new feature systems"
arch=('i686' 'x86_64')
url="http://github.com/mcallegari/qlcplus"
license=('GPL2' )
depends=('qt4' 'libftdi' 'shared-mime-info' 'ola-git')
makedepends=('git')
provides=('qlc')
replaces=('qlc' 'qlc-svn')
_gitroot="https://github.com/mcallegari/qlcplus.git"
_gitname="qlcplus"

build() {
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "${srcdir}/$_gitname"
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/$_gitname"
  make INSTALL_ROOT="$pkgdir/" install
}
