pkgname=tinc
pkgver=1.0.16
pkgrel=1
pkgdesc="VPN (Virtual Private Network) daemon"
arch=(i686 x86_64)
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo2' 'zlib' 'openssl')
source=(http://www.tinc-vpn.org/packages/tinc-$pkgver.tar.gz)
md5sums=('f1c7ed94878725fb2cf4efb02bf160da')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
  make DESTDIR="$startdir/pkg" install

  mkdir -p $startdir/pkg/etc/tinc/
  tar xzvf doc/sample-config.tar.gz -C $startdir/pkg/etc/tinc/
}
