# Contributor: Minimalist <minimalist@lavabit.com>

pkgname=perl-validate-tiny
pkgver=0.04
pkgrel=1
pkgdesc="Validate::Tiny - Minimalistic data and form validation"
arch=('any')
url="http://search.cpan.org/~minimal/Validate-Tiny/"
license=('PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MINIMAL/Validate-Tiny-$pkgver.tar.gz)
md5sums=('bfe6b023a7bec60cc0f86709e450f39f')

build() {
  cd "$srcdir/Validate-Tiny-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make test || return 1
  make install DESTDIR="$pkgdir/" || return 1

}
