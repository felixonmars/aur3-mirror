# Contributor: Strafer <strafer@ufaley.su>

pkgname=qutim-plugin-urlpreview-svn
pkgver=8
pkgrel=2
pkgdesc="urlpreview plugin for qutim"
arch=('i686' 'x86_64')
url="http://www.qutim.org/forum/viewtopic.php?f=62&t=804"
license=('GPL')
makedepends=('wget' 'tar' 'gzip')
depends=('qutim')

_svnmod=qutim-urlpreview
_svntrunk=https://boiler.co.ru/svn/qutim-urlpreview

build() {
 msg "Connecting to qutim.org SVN server..."
 cd $srcdir
 if [ -d $_svnmod/.svn ]; then
   (cd $_svnmod && svn up)
 else
    svn co $_svntrunk
 fi
 msg "SVN checkout done or server timeout"

 cd $srcdir
 rm -rf $_svnmod-build
 cp -rf $_svnmod $_svnmod-build
 
 msg "Starting make..."  
 cd $srcdir/$_svnmod-build 
 qmake || return 1 
 make || return 1
 
 install -Dm 644 \
  $srcdir/$_svnmod-build/liburlpreview.so \
  $pkgdir/usr/lib/qutim/liburlpreview.so || return 1

 rm -rf $srcdir/$_svnmod-build
}
