# Maintainer:  Farhad Shahbazi <farhad@enthusiasm.cc>

pkgname=tbar-git
_pkgname=tbar
pkgver=20110520
pkgrel=1
pkgdesc="a tool bar capable of displaying your system's status"
url="http://siyb.mount.at/tbar/"
arch=('any')
license=('GPL3')
depends=('tcl' 'tk' 'tcllib')
makedepends=('git')
optdepends=('sqlite3-tcl: calendar support')
provides=('tbar')
conflicts=('tbar')
source=()
md5sums=()

_gitrepo="git://hades.mount.at/siyb/tbar"

build() {
  cd ${srcdir}

  msg "Getting source..."
  if [ -d $_pkgname ]; then
    cd $_pkgname
    git pull || return 1
  else
    git clone $_gitrepo $_pkgname || return 1
    cd $_pkgname
  fi
  msg "GIT  checkout done or server timeout"

  make DESTDIR="$pkgdir/" install || return 1
}
