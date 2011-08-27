# Contributor: RkG
# First package, any help will be welcome

pkgname=dbslayer
pkgver=12
pkgrel=1
pkgdesc="Lightweight database abstraction layer suitable for high-load websites featuring connection pooling"
arch=('i686' 'x86_64')
url="http://code.nytimes.com/projects/dbslayer/"
license=('Apache License')
depends=('apr' 'apr-util' 'mysql-clients')
makedepends=('tar' 'sed' 'automake')
source=(http://code.nytimes.com/downloads/$pkgname-beta-$pkgver.tgz)
md5sums=('a529ea503c244d723166f78c75df3bb3')

build() {
cd ${srcdir}/dbslayer
./configure --prefix=/usr/
sed -i s/\-1\.10//g Makefile
make || return 1
make DESTDIR=${pkgdir} install
}
