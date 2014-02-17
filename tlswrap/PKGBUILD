# Contributor: Frieder Schüler <frieder.schueler@gmail.com>
pkgname=tlswrap
pkgver=1.04
pkgrel=2
pkgdesc="A TLS/SSL FTP wrapper/proxy that allows you to use your favourite FTP client with any TLS/SSL-enabled FTP server"
arch=('i686' 'x86_64')
url="http://tlswrap.com/"
license=('custom')
depends=('openssl')
source=(http://tlswrap.com/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  install -Dm755 tlswrap $pkgdir/usr/bin/tlswrap
  install -Dm644 README $pkgdir/usr/share/tlswrap/README
  install -Dm644 COPYING $pkgdir/usr/share/licenses/tlswrap/COPYING
}
md5sums=('68a4d937c1e817fa3056751e8902b691')
 
