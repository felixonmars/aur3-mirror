# Maintainer: Daniel King <cnkknd+aur@gmail.com>

pkgname=codelite-svn
pkgver=3380
pkgrel=1
pkgdesc="CodeLite, an open-source, cross platform IDE for the C/C++ programming languages."
arch=("i686" "x86_64")
license=('GPL')
url="http://codelite.org/"
depends=('wxgtk>=2.8.4')
makedepends=('subversion')
conflicts=('codelite')
replaces=('codelite')
provides=('codelite')
source=()
md5sums=()

_svnmod="codelite"
_svntrunk="https://codelite.svn.sourceforge.net/svnroot/codelite/trunk"

build() {
  cd $srcdir/
  msg "Getting source..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Creating make environment..."
  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  msg "Starting make..."
  
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=$pkgdir install
    
  rm -rf $srcdir/$_svnmod-build
}

