# Contributor: Emanuele Rossi <newdna1510@yahoo.it>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: Jeroen Maris <jamaris@gmail.com>
# Contributor: Nuno Aniceto <nuno.aja@gmail.com>
arch=(i686 x86_64)
pkgname=kmplayer-svn
pkgver=1316685
pkgrel=1
pkgdesc="KMplayer svn version for KDE4"
url="http://kmplayer.kde.org/"
license="GPL"
depends=('kdelibs' 'kdebase-runtime')
optdepends=('gtk2')
makedepends=('subversion' 'cmake' 'automoc4')
conflicts=('kmplayer')
provides=('kmplayer')
install="${pkgname}.install"
source=()
md5sums=()
 
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/multimedia/kmplayer/
_svnmod=kmplayer
 
build() {
  cd $srcdir
 
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
 
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
 
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
 
  cmake -DCMAKE_BUILD_TYPE=debugfull -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=$pkgdir/ install
 
  rm -rf $srcdir/$_svnmod-build
 
  # this should not be necessary, but these icons
  # are already provided by kdebase-workspace
  rm -rf $pkgdir/usr/share/icons/oxygen
}
# vim:syntax=sh
