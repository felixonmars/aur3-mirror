pkgname=perl-net-scp-expect
pkgver=0.16
pkgrel=1
pkgdesc="Net::SCP::Expect - Wrapper for scp that allows passwords via Expect."
arch=('any')
url="http://search.cpan.org/~rybskej/Net-SCP-Expect-0.16/Expect.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-net-ipv6addr' 'perl-term-read-password' 'perl-expect')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/R/RY/RYBSKEJ/Net-SCP-Expect-$pkgver.tar.gz)
md5sums=('a3d8f5e6a34ba3df8527aea098f64a58')

build() {
  cd  "$srcdir/Net-SCP-Expect-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}