# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=hacktray-git
pkgver=20101130
pkgrel=1
pkgdesc='A simple application launcher for all kind of desktop sessions'
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php?content=135572"
license=('GPL')
depends=('qt')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://gitorious.org/hacktray/hacktray.git"
_gitname="hacktray"

build(){
  cd ${srcdir}

  if [[ -d $_gitname ]]; then
	(cd $_gitname && git pull origin)
  else
	git clone $_gitroot $_gitname
  fi

  cd $_gitname
  qmake HackTray.pro
  make
}

package() {
  cd ${srcdir}/$_gitname
  make INSTALL_ROOT=${pkgdir} install
}
