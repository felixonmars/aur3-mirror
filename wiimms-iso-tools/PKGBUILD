# Maintainer: Gereon Schomber
pkgname=wiimms-iso-tools
pkgver=2336
pkgrel=1
pkgdesc="A set of command line tools to manipulate Wii and GameCube ISO images and WBFS containers"
arch=(i686 x86_64)
url="http://wit.wiimm.de/"
license=('GPL')
depends=("fuse")
makedepends=('subversion')
source=("makefile.patch")
noextract=()

_svntrunk=http://opensvn.wiimm.de/wii/trunk/${pkgname}
_svnmod=${pkgname}

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

  patch < $srcdir/makefile.patch  
  make DESTDIR="$pkgdir/" all
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
sha1sums=('e499b54fbe4a3e85ef8ec49c4141c4e3c4aa1b3f')
