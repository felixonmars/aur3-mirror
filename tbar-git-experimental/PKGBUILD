# Maintainer:  Marc ' Bomba ' Schulte <bomba@nerdstube.de>

pkgname=tbar-git-experimental
_pkgname=tbar
pkgver=999
pkgrel=1
pkgdesc="a tool bar capable of displaying your system's status"
url="http://siyb.mount.at/tbar/"
arch=('any')
license=('GPL3')
depends=('tcl' 'tk' 'tcllib' 'sqlite3-tcl' 'unixsocket-tbar')
makedepends=('git')
optdepends=()
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
    git pull && git checkout experimental || return 1
  else
    git clone $_gitrepo $_pkgname || return 1
    cd $_pkgname
    git checkout experimental || return 1
  fi
  msg "GIT  checkout done or server timeout"

  make DESTDIR="$pkgdir/" install || return 1
}

