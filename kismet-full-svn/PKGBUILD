# Original: Asparagus Maximus <asparagus.maximus () gmail () com>

pkgname=kismet-full-svn
pkgver=2891
pkgrel=1
pkgdesc="802.11b sniffing software with all plugins"
arch=(i686 x86_64)
license=('GPL')
depends=('gmp' 'imagemagick' 'libpcap>=1.0.0' 'ncurses' 'dbus')
optdepends=('perl-libwww')
url="http://www.kismetwireless.net/"
backup=('etc/ap_manuf' 'etc/client_manuf' 'etc/kismet.conf' 'etc/kismet_drone.conf' 'etc/kismet_ui.conf')
conflicts=('kismet' 'kismet-svn' 'kismet-ptw-svn')
provides=('kismet')
source=()
md5sums=()

_svntrunk=https://www.kismetwireless.net/code/svn/trunk
_svnmod=kismet-devel

build() {
  cd $srcdir
  msg "Updating SVN entries for $_svnmod ..."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  cp -r $_svnmod $_svnmod-build

  cd $_svnmod-build

  msg "Finished update, starting build ..."
  
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var

  make dep
  make ||return 1
 
  cd plugin-ptw/
  KIS_SRC_DIR=../ make ||return 1
  KIS_DEST_DIR=$startdir/pkg/usr make install 
  cd ..
  make DESTDIR=$startdir/pkg/ install
  
  cd plugin-spectools
  KIS_SRC_DIR=../ make ||return 1
  KIS_DEST_DIR=$startdir/pkg/usr make install 
  cd ..
  make DESTDIR=$startdir/pkg/ install
  
  rm -rf $srcdir/$_svnmod-build
}
