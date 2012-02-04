# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-webservice-mtgox
pkgver=0.05
pkgrel=1
pkgdesc="Perl module providing access to mtgox.com's Bitcoin trading API"
arch=("any")
url="http://search.cpan.org/dist/WebService-MtGox/"
license=("GPL" "PerlArtistic")
depends=("perl" "perl-libwww" "perl-io-socket-ssl" "perl-json" "perl-moo" "perl-ouch" "perl-try-tiny" "perl-common-sense" "perl-data-dump")
source=(http://search.cpan.org/CPAN/authors/id/B/BE/BEPPU/WebService-MtGox-$pkgver.tar.gz)
md5sums=("b17ce56a267cd910f34282834e7eeaea")

build() {
  cd "$srcdir/WebService-MtGox-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/WebService-MtGox-$pkgver"
  make test
}

package() {
  cd "$srcdir/WebService-MtGox-$pkgver"
  make install DESTDIR="$pkgdir"
}
