# Contributor: totoloco <totoloco at gmail>
pkgname=skphpide-svn
pkgver=81
pkgrel=1
pkgdesc="A PHP IDE written in C++ with features like code completion, code templates, find (and replace) in project."
arch=(i686 x86_64)
url="http://www.shishkabab.net/skphpide.html"
license=('unknown')
depends=(kdelibs qt)
makedepends=(svn gcc cmake make)
optdepends=(php)
provides=(skphpide)
conflicts=(skphpide)
replaces=(skphpide)
source=()
md5sums=()
_svntrunk=https://skphpide.svn.sourceforge.net/svnroot/skphpide/trunk/
_svnmod=skphpide

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up && make clean)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_svnmod"

  CMakeFlags="-DBIN_INSTALL_DIR=/usr/bin -DXDG_APPS_INSTALL_DIR=/usr/share/applications -DDATA_INSTALL_DIR=/usr/share/kde4/apps"
  cmake $CMakeFlags . || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
