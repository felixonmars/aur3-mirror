# Maintainer: Yoel Lion <yoel3ster at gmail dot com>

pkgname=luach-svn
pkgver=47
pkgrel=1
pkgdesc="Hebrew calander using Qt4 library"
arch=('i686' 'x86_64') 
url="http://code.google.com/p/luach/"
license=('GPL2')
depends=('qt' 'libhdate' 'java-runtime')
makedepends=('subversion')
_svntrunk=http://luach.googlecode.com/svn/trunk/
_svnmod=luach

build() {
svn co $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
cd $srcdir/$_svnmod
qmake
make 
install -Dm 755 $_svnmod $pkgdir/usr/bin/$_svnmod
install -Dm 755 ZmanimCLI.jar $pkgdir/usr/bin/ZmanimCLI.jar
install -Dm 755 zmanimcli $pkgdir/usr/bin/zmanimcli
install -Dm 644 Luach.desktop $pkgdir/usr/share/applications/Luach.desktop
install -Dm 644 Icons/calendar.png $pkgdir/usr/share/Luach/calendar.png
install -Dm 644 Hebrew.qm $pkgdir/usr/share/Luach/Hebrew.qm
rm -rf $srcdir/$_svnmod
}

