# Maintainer: Janno T. <jaxnnxot@gmail.com>
_author=SISYPHUS
_perlmod=Math-GMPz
pkgname=perl-math-gmpz
pkgver=0.32
pkgrel=0
pkgdesc="perl interface to the GMP library's integer (mpz) functions."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0', 'gmp')
options=(!emptydirs)
source=(http://cpan.perl.org/modules/by-authors/id/S/SI/$_author/$_perlmod-$pkgver.tar.gz)
md5sums=('1d41be7ee29a40f0dcf37bdb8306a41e')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
