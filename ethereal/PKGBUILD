# Maintainer: gunnar <tomtinn@gmail.com>

pkgname=ethereal
pkgver=0.99.0
pkgrel=1
pkgdesc="Powerful Multi-Platform Analysis"
arch=('i686' 'x86_64')
url="http://www.ethereal.com/"
license=('GPLv2')
depends=('libpcap' 'heimdal' 'openssl' 'glib2' 'zlib' 'gtk2')
optdepends=('adns' 'net-snmp')
source=(http://www.ethereal.com/distribution/ethereal-0.99.0.tar.gz)  
md5sums=('92490abe23df1b2078579c512c788f9d')
build() {
cd $srcdir/$pkgname-$pkgver
./configure --prefix=/usr --with-ssl=/usr/lib 
make || return 1
make DESTDIR=${startdir}'/pkg' install
}
