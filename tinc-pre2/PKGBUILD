pkgname=tinc-pre2
pkgver=1.1pre5
pkgrel=1
pkgdesc="VPN (Virtual Private Network) daemon (Pre-release)"
arch=(i686 x86_64)
url="http://www.tinc-vpn.org/"
license=('GPL')
depends=('lzo2' 'zlib' 'openssl')
provides=('tinc-pre')
conflicts=('tinc' 'tinc-pre')
source=(http://www.tinc-vpn.org/packages/tinc-$pkgver.tar.gz)
md5sums=('8586352f7ff41820b529fd463ee80489')

build() {
cd "$startdir/src/tinc-$pkgver"

./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
make
make DESTDIR="$startdir/pkg" install

mkdir -p $startdir/pkg/etc/tinc/
tar xzvf doc/sample-config.tar.gz -C $startdir/pkg/etc/tinc/
}
