# Maintainer: cF8 <cf8@cf8.ru>
pkgname=pichi-git
pkgver=20110808
pkgrel=1
pkgdesc="Pichi is a jabber(xmpp) bot written in C++. It is based on the sulci abilities. GIT version."
arch=(i686 x86_64)
url="http://code.google.com/p/pichi/"
license=('GPLv2')
depends=('curl' 'boost' 'sqlite3' 'gloox')
makedepends=('cmake' 'make')
conflicts=('pichi')
provides=('pichi')

_gitroot="git://github.com/eNoise/pichi.git"
_gitname="pichi"

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  blddir="${srcdir}/$_gitname-build"
  rm -rf "${blddir}"
  git clone "$srcdir/$_gitname"  ${blddir}
  cd "${blddir}"

  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release \
    -DLOCAL_TINYXML=ON 
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

