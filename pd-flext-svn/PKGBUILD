# Contributor: Bernardo Barros <bernardobarros@gmail.com>

pkgname=pd-flext-svn
pkgver=3735
pkgrel=1
pkgdesc="C++ development layer for Pure Data and Max/MSP"
arch=('i686' 'x86_64')
url="http://puredata.info/Members/thomas/flext/"
license=('GPL')
groups=('pd-externals')
makedepends=('subversion' 'pd') #'sndobj'
provides=('pd-flext')
conflicts=('pd-flext')

_svntrunk=https://svn.grrrr.org/ext/trunk/flext
_svnmod=flext

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi


  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  ./bootstrap.sh

  ./configure --prefix=/usr \
    --with-sdkdir=/usr/include/pdextended \
    --with-pdbindir=/usr/bin \
    --with-stk=/usr/include/stk \
    --enable-dependency-tracking

  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
