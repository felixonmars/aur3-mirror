# Maintainer: Michael Eckert michi_05@gmx.net

pkgname=perl-xmlrpc-frontier
pkgver=0.07b4
pkgrel=1
pkgdesc="The XML RPC implemention for Perl"
arch=('any')
url="http://cpan.mirror.clusters.kg"
depends=("perl")
license=('GPL')
source=($url/authors/id/K/KM/KMACLEOD/Frontier-RPC-$pkgver.tar.gz
)

md5sums=('c04582da604f11bdbe60606738f92457')

build() {
    cd ${srcdir}/Frontier-RPC-${pkgver} 
    perl Makefile.PL PREFIX=${pkgdir}/usr/
    make 
    make test
    make install
}
