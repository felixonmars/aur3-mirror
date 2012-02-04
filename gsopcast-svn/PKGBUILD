# Contributor: jarryson <jarryson@gmail.com>

pkgname=gsopcast-svn
pkgver=54
pkgrel=1
pkgdesc="A GTK front-end of p2p TV sopcast without ALSA"
arch=('i686') # sopcast only available on i686
url="http://code.google.com/p/gsopcast/"
license=('GPL')
depends=('sopcast' 'gtk2' 'cairo')
makedepends=('pkgconfig' 'subversion' 'gnome-common')
source=()
conflicts=('gsopcast')
replace=('gsopcast')
md5sums=()                  
_svnmod="gsopcast"
_svntrunk="http://gsopcast.googlecode.com/svn/trunk/"

build()  {
  cd $startdir/src

  msg "Getting sources..."
  svn co $_svntrunk $_svnmod -r $pkgver
  
  if [ -d $_svnmod-build ];then
  	rm -r $_svnmod-build
  fi
  
  cp $_svnmod $_svnmod-build -r
  cd $_svnmod-build
  
  patch -Np0 -i ../../noalsa.patch || return 1
  patch -Np0 -i ../../gsopcast-xdg.patch || return 1
  ./autogen.sh --prefix=/usr --disable-alsa
  ./configure --prefix=/usr --disable-alsa
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
