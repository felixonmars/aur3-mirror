#Contributor: Matt McDonald <metzen@gmail.com>

pkgname=pacmon-svn
pkgver=17
pkgrel=1
pkgdesc="Tray applet that notifies the user of available pacman updates"
url="http://code.google.com/p/pacmon/"
license="GPL"
depends=('pygtk>=2.10' 'python-egenix-mx-base' 'vte')
provides=('pacmon')
conflicts=('pacmon')
source=()
md5sums=()
install='pacmon.install'

_svntrunk=http://pacmon.googlecode.com/svn/trunk/
_svnmod=pacmon

build() {
  cd $startdir/src/
  svn co $_svntrunk $_svnmod -r $pkgver

  cd $startdir/src/$_svnmod
  #./configure --prefix=/usr
  #make || return 1
  make PREFIX=/usr DESTDIR=$startdir/pkg install
}
