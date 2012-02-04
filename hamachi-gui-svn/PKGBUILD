# Contributor: grimi <grimi at poczta dot fm>

pkgname=hamachi-gui-svn
pkgver=190
pkgrel=2
pkgdesc="A graphical user interface for the zero configuration VPN client Hamachi"
arch=('i686' 'x86_64')
url="http://hamachi-gui.sourceforge.net"
license=('GPL')
depends=('hamachi' 'libglade')
makedepends=('subversion' 'intltool' 'gnome-common')
provides=('hamachi-gui')
conflicts=('hamachi-gui')


_svntrunk=https://hamachi-gui.svn.sourceforge.net/svnroot/hamachi-gui
_svnmod=hamachi-gui

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
  cd "$srcdir/$_svnmod-build/trunk"

  #
  # BUILD
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}
