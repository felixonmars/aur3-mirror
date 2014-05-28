# Maintainer: Dustin Wilhoit <wilhoit@gmail.com>
_author=zwon
_perlmod=RedisDB
pkgname=perl-redisdb
pkgver=2.36
pkgrel=1
pkgdesc="RedisDB - Perl extension to access redis database"
arch=(any)
url="http://search.cpan.org/dist/RedisDB/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-try-tiny' 'perl-encode' 'perl-redisdb-parser' 'perl-io-socket-ip')
makedepends=('perl-test-failwarnings' 'perl-test-tcp' 'perl-test-differences' 'perl-digest-sha')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/Z/ZW/ZWON/$_perlmod-$pkgver.tar.gz)
md5sums=('53d93c577b3c1645bf6e60aadf6f3444')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Fixing a check error or a quit command and swapping it for a reset connection.
  sed -i -e "108s/$redis->quit;/$redis->reset_connection;/" t/basic_redis.t

  PERL_MM_USE_DEFAULT=1 make test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# vim:set ts=2 sw=2 et:
