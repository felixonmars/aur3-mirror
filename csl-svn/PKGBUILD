# Cube Server Lister
# Contributor: Ivo Benner <ivo.benner[at]web.de>
pkgname=csl-svn
pkgver=295
pkgrel=1
pkgdesc="cube server lister"
arch=('any')
url="http://cubelister.sourceforge.net"
license=('GPL')
groups=()
depends=()
makedepends=('subversion')
provides=('cls')
conflicts=()
replaces=()
backup=()
options=()
#install=
source=('justice.patch')
noextract=()
md5sums=('d370c710f66b72eec015f9dd12d2a6c5')

_svntrunk=http://cubelister.svn.sourceforge.net/svnroot/cubelister/trunk
_svnmod=csl-svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  msg "Applying patches..."
  patch -p0 < $srcdir/justice.patch || return 1

  msg "Starting make..."
  make -f Makefile.cvs
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
