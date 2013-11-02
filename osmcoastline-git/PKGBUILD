# Maintainer einbisschen <duemig .AT. in .DOT. tum .DOT. de>

pkgname=osmcoastline-git
pkgver=20131101
pkgrel=1
pkgdesc="Extracts coastline data from OpenStreetMap planet file"
arch=('i686' 'x86_64')
url="https://github.com/joto/osmcoastline"
license=('GPL3')
depends=('osmium' 'boost-libs' 'zlib' 'gdal' 'geos' 'expat')
makedepends=('git' 'boost')
checkdepends=('cppcheck')
provides=('osmcoastline')

_gitroot="https://github.com/joto/osmcoastline.git"
_gitname="osmcoastline"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

check() {
  cd "$srcdir/$_gitname-build"
  
  make check
}

package() {
  cd "$srcdir/$_gitname-build"
  
  install -Dm755 osmcoastline ${pkgdir}/usr/bin/osmcoastline
}
