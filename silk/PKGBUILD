# Maintainer: William Robertson <nullptr@gmail.com>

pkgname='silk'
pkgver='3.7.2'
pkgrel='1'
pkgdesc='CERT netflow tools.'
arch=('i686' 'x86_64')
url='http://tools.netsa.cert.org/silk'
license=('GPL')
groups=()
depends=('zlib' 'lzo2' 'libpcap' 'python2')
makedepends=('perl' 'flex' 'bison')
optdepends=(
	'adns: asynchronous dns support'
	'gnutls: TLS support'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://tools.netsa.cert.org/releases/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('01474e6996892d0ab67752bee858da6d')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --enable-ipv6 --with-python --enable-output-compression
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

