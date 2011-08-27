# Contributer: Przemys³aw Bia³kowski <chemaniak@wp.pl> 

pkgname=lintar
pkgver=0.6.2
pkgrel=1
pkgdesc="Gtk frontend to tar zip gzip bz2"
url="http://lintar.sourceforge.net"
license="GPL"
arch=('i686' 'x86_64')
depends=('gtk2' 'gnome-vfs')
source=("http://downloads.sourceforge.net/lintar/$pkgname-$pkgver.tar.gz")
md5sums=('231502ef10d91035837fa275b029a411')


build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure prefix=/usr
  make || 1
  make DESTDIR=${startdir}/pkg install || return 1
}
