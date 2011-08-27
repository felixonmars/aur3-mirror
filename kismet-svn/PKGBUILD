# Contributor: Asparagus Maximus <asparagus.maximus () gmail () com>

pkgname=kismet-svn
pkgver=2847
pkgrel=2
pkgdesc="802.11b sniffing software"
arch=(i686 x86_64)
license=('GPL')
depends=('gmp' 'imagemagick' 'libpcap>=1.0.0' 'ncurses' 'dbus')
optdepends=(perl-libwww)
url="http://www.kismetwireless.net/"
backup=('etc/ap_manuf' 'etc/client_manuf' 'etc/kismet.conf' 'etc/kismet_drone.conf' 'etc/kismet_ui.conf')
conflicts=('kismet')
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
  
  ./configure --prefix=/usr --sysconfdir=/etc 
  make || return 1
  make DESTDIR=$pkgdir install
  
  rm -rf $srcdir/$_svnmod-build
}
