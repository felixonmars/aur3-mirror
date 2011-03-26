# Contributor:  L0cutus <stefano.zamprogno@gmail.com>
pkgname=lshw-svn
pkgver=2042
pkgrel=1
pkgdesc="Lshw is a small tool to provide detailed information on the hardware configuration of the machine. (svn version)"
url="http://ezix.org/project/wiki/HardwareLiSter"
license="GPL"
arch=(i686 x86_64)
depends=('gtk2')
provides=('lshw')
conflicts=('lshw')
makedepends=('subversion')
source=()
md5sums=()

_svnmod=lshw
_svntrunk=http://dev.ezix.org/source/packages/lshw/development

build() {
  cd $startdir/src
  # Be sure to have a ~/.subversion.  If it doesn't exist, touch it.
  touch ~/.subversion

  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -a $_svnmod ${_svnmod}-build
  cd ${_svnmod}-build

  make || return 1
  make DESTDIR=$startdir/pkg install

  # require glade-2
  #make gui || return 1
  #make DESTDIR=$startdir/pkg install-gui

  rm -rf $startdir/src/${_svnmod}-build
}

# vim:syntax=sh
