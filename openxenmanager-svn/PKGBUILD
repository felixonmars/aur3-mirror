pkgname=openxenmanager-svn
pkgver=82
pkgrel=1
pkgdesc="An opensource multiplatform clone of XenCenter (Citrix)"
arch=('i686' 'x86_64')
depends=('pygtk' 'glade' 'python2-gtkchart-git' 'gtk-vnc' 'rrdtool')
makedepends=('subversion')
replaces=('openxencenter-svn')
license=('GPL2')
url="http://www.openxenmanager.com/"
source=("oxm" "openxenmanager.desktop")
md5sums=('b7b5859655682dc19cf7ba96a3c2fd63' '0801716f853393b39b3678de707fdb27')

_svntrunk=https://openxenmanager.svn.sourceforge.net/svnroot/openxenmanager/trunk
_svnmod=openxenmanager

build() {
  svn co $_svntrunk $_svnmod  
  msg "SVN checkout done or server timeout"  
  msg "Starting make..."
 
}

package() {
  cd "$srcdir/$_svnmod"

  python2 -O -m py_compile *.py

  install -dm755 $pkgdir/opt/$pkgname/{images,plugins}
  install -m644 *.{py,pyo,conf,glade} $pkgdir/opt/$pkgname
  install -m644 images/* $pkgdir/opt/$pkgname/images
  install -m644 plugins/* $pkgdir/opt/$pkgname/plugins
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm755 $srcdir/oxm $pkgdir/usr/bin/oxm
  install -Dm644 $srcdir/openxenmanager.desktop $pkgdir/usr/share/applications/openxenmanager.desktop
}
