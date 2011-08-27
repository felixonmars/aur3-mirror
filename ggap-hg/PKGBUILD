# Maintainer: Kevin Whitaker <eyecreate at gmail dot com>
# Contributor: Michal Kowalski <kowalski.michal@gmail.com>

pkgname=ggap-hg	
pkgver=701
pkgrel=2
pkgdesc="GGAP is a frontend for GAP computer algebra system."
arch=('i686' 'x86_64')
url="http://ggap.sourceforge.net/"
license=('GPL')
depends=('zlib' 'gap-math' 'qt')
makedepends=('mercurial' 'cmake' 'gcc')
provides=('ggap')
conflicts=('ggap')

_hgroot="https://bitbucket.org/muntyan"
_hgrepo="ggap"

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server $_hgroot"
  if [ -d $_hgrepo ]; then
    cd $_hgrepo
    hg pull -u || return 1
    msg "Finished updating the local repository!"
  else
    hg clone ${_hgroot} || return 1
    msg "Initial pull complete!"
    cd $_hgrepo
  fi

  ./configure
  make
  make install
}

