# Contributor: totoloco <totoloco at gmail dot com>
pkgname=klavaro-svn
pkgver=139
pkgrel=1
pkgdesc="Klavaro is just another free touch typing tutor program."
arch=('i686' 'x86_64')
url="http://klavaro.sourceforge.net/"
license=('GPL2')
depends=('gtkdatabox' 'curl')
provides=('klavaro')
conflicts=('klavaro')
md5sums=()
source=()

_svntrunk=https://klavaro.svn.sourceforge.net/svnroot/klavaro/trunk/
_svnmod=klavaro

build() {
  cd "$srcdir"

  msg "SVN checking out..."
  svn co $_svntrunk --config-dir ./ $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}
