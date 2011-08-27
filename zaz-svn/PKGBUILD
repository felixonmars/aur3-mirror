# Contributor: totoloco at gmail

pkgname=zaz-svn
pkgver=35
pkgrel=1
pkgdesc="Puzzle game where the player has to arrange balls in triplets."
arch=("i686" "x86_64")
url="http://sourceforge.net/projects/zaz/"
license=('GPL3')
makedepends=(ftgl)
provides=('zaz')
conflicts=('zaz')
replaces=('zaz')
source=()
md5sums=()

_svntrunk="https://zaz.svn.sourceforge.net/svnroot/zaz"
_svnmod="zaz"

build() {
  msg "Starting SVN checkout..."
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."  

  cd $srcdir/$_svnmod

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
