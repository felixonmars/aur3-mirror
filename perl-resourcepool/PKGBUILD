# Maintainer: Sebastien Bariteau <numkem@gmail.com>
pkgname=perl-resourcepool
pkgver=1.0107
pkgrel=1
pkgdesc="Perl/CPAN ResourcePool A connection caching and pooling class"
arch=(any)
license=(GPL)
url="http://search.cpan.org/~mws/ResourcePool/"
source="http://search.cpan.org/CPAN/authors/id/M/MW/MWS/ResourcePool-${pkgver}.tar.gz"
depends=('perl')
options=(!emptydirs)
md5sums=('68309f7a243347a4c48908f534fff1e6')
provides=('ResourcePool.pm')

build() {
  cd "$srcdir/ResourcePool-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make  || return 1
  make install DESTDIR=${pkgdir} || return 1

  # remove perllocal.pod and .packlist
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
