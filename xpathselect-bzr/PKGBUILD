# Maintainer: Charles Bos <charlesbos1 AT gmail>

pkgname=xpathselect-bzr
pkgver=41
pkgrel=1
_bzrname=xpathselect
pkgdesc="A simple library that implements a subset of the XPath spec to allow selecting nodes in an object tree."
arch=('i686' 'x86_64')
url="https://launchpad.net/xpathselect"
license=('GPL')
makedepends=('bzr' 'cmake')
provides=('xpathselect')
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~autopilot/$_bzrname/1.4/"
        '0001_Disable_Tests.patch')
md5sums=('SKIP'
         '6824d2924a9f2fdbd118bb39233aa16b')

pkgver() {
  cd "$srcdir"/$_bzrname
  bzr revno
}

prepare() {
  cd "$srcdir"/$_bzrname

  if [ ! -d /usr/src/gtest/ ]; then
    patch -p1 -i "${srcdir}/0001_Disable_Tests.patch"
  fi
}


build() {
  cd "$srcdir"/$_bzrname
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

package() {
  cd "$srcdir"/$_bzrname
  make DESTDIR="$pkgdir" install
}



