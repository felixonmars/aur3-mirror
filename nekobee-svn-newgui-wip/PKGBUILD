# Contributor: Your Name <youremail@domain.com>
pkgname=nekobee-svn-newgui-wip
pkgver=161
pkgrel=1
pkgdesc="TB-303 as DSSI plugin with fancy GUI, work in progress"
arch=('i686' 'x86_64')
url="http://www.nekosynth.co.uk/wiki/nekobee"
license=('GPL')
depends=('gtk2' 'liblo')
makedepends=('subversion' 'dssi')
provides=('nekobee')
options=(!libtool)
install=

_svntrunk=svn://www.nekosynth.co.uk/nekosynth/nekobee/branches/newgui
_svnmod=nekobee

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

  #
  # BUILD
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
