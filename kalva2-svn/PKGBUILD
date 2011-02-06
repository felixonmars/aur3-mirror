# Contributor:  Emanuele Rossi <newdna1510@yahoo.it>
arch=(i686 x86_64)
pkgname=kalva2-svn
pkgver=899143
pkgrel=1
pkgdesc="Kalva2 - Multimedia player for kde 4.x"
url="http://www.kde.org/"
license="GPL"
depends=('kdelibs' 'phonon')
makedepends=('subversion' 'cmake' 'automoc4')

source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/multimedia/kalva2/
_svnmod=kalva2

build() {
  cd $startdir/src

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
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build

  # this should not be necessary, but these icons
  # are already provided by kdebase-workspace
  #rm -rf $startdir/pkg/usr/share/icons/oxygen

  # make KMPlayer appear in KDE's menu:
  #mkdir -p $startdir/pkg/usr/share/applications/kde4
  #cp $startdir/KMPlayer.desktop $startdir/pkg/usr/share/applications/kde4/KMplayer.desktop
}
# vim:syntax=sh
 
