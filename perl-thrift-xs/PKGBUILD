# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=perl-thrift-xs
pkgver=1.04
pkgrel=1
pkgdesc="Thrift::XS - Faster Thrift binary protocol encoding and decoding"
arch=(any)
license=(GPL)
url="http://search.cpan.org/~agrundma/Thrift-XS-1.04/lib/Thrift/XS.pm"
source="http://search.cpan.org/CPAN/authors/id/A/AG/AGRUNDMA/Thrift-XS-${pkgver}.tar.gz"
depends=('perl')
options=(!emptydirs)
md5sums=('90dad59d4ce205a2218969d7df73c203')
provides=('Thrift::XS.pm')

build() {
  cd "$srcdir/Thrift-XS-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
