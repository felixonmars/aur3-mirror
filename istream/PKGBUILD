# $Id: $
# Contributer: Jelle van der Waa <jellevdwaa@gmail.com>
pkgname=istream
pkgver=0.10
pkgrel=c
pkgdesc="GNOME Panel Applet to play internet radio streams."
url="http://www.gnomefiles.org/app.php?soft_id=1173"
arch=('i686')
license=('GPL')
groups=('gnome')
depends=('gnome-panel' 'gstreamer0.10')
makedepends=('pkgconfig')
source=(http://www.jochen-baier.de/istream/$pkgname-$pkgver.tar.gz)
md5sums=('0fbcd9709c512af798dd6270e56e6710')


build() {
  cd $startdir/src/$pkgname-$pkgver$pkgrel
  ./configure --prefix=/opt/gnome
  make || return 1
  make DESTDIR=$startdir/pkg install

  sed -i -e 's:location="/usr:location="/opt/gnome:' \
    $startdir/pkg/opt/gnome/lib/bonobo/servers/GNOME_istreamApplet.server
}
