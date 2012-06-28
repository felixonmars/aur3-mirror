#Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=perl-pod-abstract
_realname=Pod-Abstract
pkgver=0.20
pkgrel=1
pkgdesc='Abstract document tree for Perl POD documents'
arch=(any)
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/~blilburne/Pod-Abstract"
options=(!emptydirs)
depends=( 'perl-io-string' 'perl-task-weaken')

source=(http://search.cpan.org/CPAN/authors/id/B/BL/BLILBURNE/${_realname}-${pkgver}.tar.gz)
md5sums=('523e77058f78590868e724e9187c4d21')

build() {
  cd ${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor
  make
}
check() {
  cd ${_realname}-${pkgver}
  make test
}
package(){
  cd ${_realname}-${pkgver}
  make install DESTDIR=${pkgdir}
}

