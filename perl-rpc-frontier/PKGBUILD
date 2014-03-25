# Maintainer: Garry Harthill gazzerh@gmail.com

pkgname=perl-rpc-frontier
pkgver=0.07b4p1
pkgrel=1
pkgdesc="The XML RPC implemention for Perl"
arch=('any')
url="http://search.cpan.org"
depends=("perl")
license=('GPL')
source=($url/CPAN/authors/id/R/RT/RTFIREFLY/Frontier-RPC-$pkgver.tar.gz
)

md5sums=('308f8b81cef0c195d83dded6d1e83f0d')

build() {
    cd ${srcdir}/Frontier-RPC-${pkgver} 
    perl Makefile.PL PREFIX=${pkgdir}/usr/
    make 
    make test
    make install
}
