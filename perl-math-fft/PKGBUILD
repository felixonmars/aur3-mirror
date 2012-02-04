# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=perl-math-fft
pkgver=1.28
pkgrel=1
pkgdesc="Perl module to calculate Fast Fourier Transforms."
arch=('i686' 'x86_64')
url="http://search.cpan.org/~rkobes/Math-FFT-1.28/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RK/RKOBES/Math-FFT-$pkgver.tar.gz)
md5sums=('de12537d06eb90e8a4d80b765ceb8252')

build() {
  cd "$srcdir/Math-FFT-$pkgver"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Math-FFT-$pkgver"

  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
}

# vim:set ts=2 sw=2 et: