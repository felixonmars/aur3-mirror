# Maintainer: crazyb0y <bjin1990 at gmail dot com>

pkgname=dshowserver-svn
pkgver=114
pkgrel=2
pkgdesc="background module of coreavc-for-linux project"
arch=('i686' 'x86_64')
depends=('wine' 'sh')
makedepends=('subversion' 'mingw32-gcc' 'make')
license=('GPL2')
url="http://code.google.com/p/coreavc-for-linux/"
install=dshowserver.install
source=(loader-makefile.patch)
sha256sums=(31cbbebd0137d4562e3c61dbdc42391b54e14bdffc2fb72bde7aa5026895c563)
_svntrunk=http://coreavc-for-linux.googlecode.com/svn/trunk/
_svnmod=coreavc-for-linux

build() {
  cd ${srcdir}
  svn co $_svntrunk -r $pkgver $_svnmod || return 1
  cd $_svnmod
  patch -p0 < ${srcdir}/loader-makefile.patch
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  sed -i 's/i586-mingw32msvc-/i486-mingw32-/g' config.mak 
  make X_COMPILE=1 || return 1
  cd dshowserver
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/dshowserver
  cp dshowserver.exe $pkgdir/usr/share/dshowserver
  echo "#!/bin/sh" > $pkgdir/usr/bin/dshowserver
  echo "echo 'Starting wine dshowserver.exe'" >> $pkgdir/usr/bin/dshowserver
  echo 'wine /usr/share/dshowserver/dshowserver.exe $*' >> $pkgdir/usr/bin/dshowserver
  chmod 775 $pkgdir/usr/bin/dshowserver
}
