# Contributor: hpestilence <hpestilence@gmail.com>
pkgname=poker3d
pkgver=1.1.33
pkgrel=1
pkgdesc="A 3d poker server and client"
url="http://mekensleep.org/index.php"
license=('GPL')
arch=('i686')
depends=('osgal-uw' 'osgcal' 'poker-network' 'python-simplejson' 'xwnc-uw')
makedepends=('pkgconfig')
groups=('pok3d')
options=(!libtool)
source=(http://pok3d.net/unstable/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('38d99ef17689e1d1726639f962df0ff2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  sed -i 's/gamesdir\ =\ \${prefix}\/games/gamesdir\ =\ \${prefix}\/bin/' $startdir/src/$pkgname-$pkgver/examples/poker/Makefile
  sed -i 's/Exec=\/usr\/games\/poker2d/Exec=\/usr\/bin\/poker3d/' $startdir/src/$pkgname-$pkgver/examples/poker/python-poker3d.desktop
  make || return 1
  make DESTDIR=$startdir/pkg install
}
