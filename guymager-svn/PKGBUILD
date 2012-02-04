# Maintainer: yannsen <ynnsen@gmail.com>
pkgname=guymager-svn
pkgver=9
pkgrel=1
pkgdesc="A forensic imager for media acquisition"
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL')
depends=(libewf libguytools)
makedepends=(subversion)
provides=(guymager)
conflicts=(guymager)
source=(main.cpp.patch guymager.pro.patch)
md5sums=('5903f736a914d4e90804a1b176a68f64'
         '3acb90e00a228205fa081c43c0927e15')
_svntrunk="https://guymager.svn.sourceforge.net/svnroot/guymager/tags/guymager-0.5.3beta1"
_svnmod=guymager

build() {
  cd $startdir/src
  msg "Connecting to SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  if [ -d "${srcdir}/${_svnmod}-build" ]; then
    rm -rf "${srcdir}/${_svnmod}-build"
  fi

  svn export $_svnmod $_svnmod-build
  cd $_svnmod-build 
  patch -Np0 < $srcdir/guymager.pro.patch || return 1
  qmake guymager.pro
  patch -Np0 < $srcdir/main.cpp.patch || return 1
  make || return 1
  lrelease guymager.pro || return 1
  install -d $pkgdir/etc/guymager/
  install -m755 $srcdir/$_svnmod-build/guymager.cfg $pkgdir/etc/guymager/
  install -m755 $pkgdir/etc/guymager/local.cfg
  install -d $pkgdir/usr/bin
  install -m755 $srcdir/$_svnmod-build/guymager $pkgdir/usr/bin
  install -d $pkgdir/usr/share/guymager/
  install -m755 $srcdir/$_svnmod-build/splash.png $pkgdir/usr/share/guymager/
  cp $srcdir/$_svnmod-build/guymager_*.qm $pkgdir/usr/share/guymager/
}

