# Contributor: Wille Marcel (wille at riseup.net)

pkgname=mousetrap-svn
pkgver=26
pkgrel=1
pkgdesc="MouseTrap translates the user's head movements into mouse events which allow users to interact with the different desktops managers and applications"
arch=('i686' 'x86_64')
url="http://live.gnome.org/MouseTrap"
depends=('gtk2' 'pygtk' 'python' 'opencv' 'pyorbit' 'python-xlib' 'python-pyspi' 'doxygen')
license=('GPL2')
source=()
md5sums=()

_svntrunk="svn://svn.gnome.org/svn/mousetrap/trunk"
_svnmod="mouseTrap"

build() {
  cd $startdir/src
  svn checkout $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd mouseTrap
  ./autogen.sh
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
