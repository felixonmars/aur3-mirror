# Contributor: Vasco Costa <vasco.costa@meiodigital.com>
pkgname=ncursesacarsdclient
pkgver=0.02.004
pkgrel=2
pkgdesc="Ncurses based client that can be used to collect ACARS data"
arch=(i686)
url="http://www.acarsd.org/"
license=('custom')
depends=('ncurses' 'zlib')
backup=('etc/ncursesclient.conf')
source=(http://www.acarsd.org/download/$pkgname-$pkgver.tgz license.txt)
md5sums=('08bcd18e38f96e1185a48d6ce13c8875' 'dac8c611f76b2da2f3d7499656bb8c23')

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -D -m755 ncursesclient $startdir/pkg/usr/bin/ncursesclient
  install -D -m644 ncursesclient.conf $startdir/pkg/etc/ncursesclient.conf
  install -D -m644 ncursesclient.hlp $startdir/pkg/usr/share/doc/ncursesacarsdclient/ncursesclient.hlp
  install -D -m644 ../license.txt $startdir/pkg/usr/share/licenses/$pkgname/license.txt
}
