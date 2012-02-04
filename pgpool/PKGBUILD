# Contributor: Gustavo Chain <g@0xff.cl>
pkgname=pgpool
pkgver=3.4.1
pkgrel=2
pkgdesc="pgpool is a connection pool server for PostgreSQL"
arch=('i686' 'x86_64')
url="http://pgpool.projects.postgresql.org/"
license=('BSD')
depends=('glibc')
makedepends=('gcc' 'make')
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
source=(http://pgfoundry.org/frs/download.php/1446/$pkgname-$pkgver.tar.gz)
md5sums=('1f876237923be8095ed6fb30885a416a')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --sysconfdir=/etc/
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

}
