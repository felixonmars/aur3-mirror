# Maintainer: Dustin Wilhoit <wilhoit@gmail.com>
_author=zwon
_perlmod=RedisDB-Parser
pkgname=perl-redisdb-parser
pkgver=2.20
pkgrel=1
pkgdesc="RedisDBi-Parser - Redis Protocol Parser for RedisDB"
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-try-tiny' 'perl-encode')
makedepends=('perl-test-failwarnings' 'perl-test-most')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/Z/ZW/ZWON/$_perlmod-$pkgver.tar.gz)
md5sums=('9d3c62775493640ce76a34e89423935e')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  PERL_MM_USE_DEFAULT=1 make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
