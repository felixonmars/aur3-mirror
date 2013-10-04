# Maintainer: Dustin Wilhoit <wilhoit@gmail.com>
_author=neophenix
_perlmod=Redis-hiredis
pkgname=perl-redis-hiredis
pkgver=0.11.0
pkgrel=1
pkgdesc="Redis::hiredis - interact with Redis using the hiredis client."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('unknown')
depends=('perl>=5.10.0')
makedepends=('')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/N/NE/NEOPHENIX/$_perlmod-$pkgver.tar.gz)
md5sums=('f9dac787b330a48413cdbfef2a2cc11f')
sha512sums=('bbc0805b483d71924ef5cc942088fab0aeb0e321f0e4c0a1b0357485b7c623d292caa936241418c2465cd8fc09c318b361ebc998e30c65687e6e603958ae9031')

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
