# Maintainer: kevku <kevku@msn.com>
pkgname=perl-perl6-subs
pkgver=0.05
pkgrel=1
pkgdesc="Perl6::Subs - Define your subroutines in the Perl 6 style."
arch=('any')
url="http://cpan.uwinnipeg.ca/dist/Perl6-Subs"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0' 'perl-parse-recdescent')
options=(!emptydirs)
source=("http://mirror.hostfuss.com/CPAN/modules/by-authors/id/CHIPS/Perl6-Subs-$pkgver.tar.gz")
md5sums=('dea930e4ac17a84475a24f483e176e0b')

build() {
  cd "$srcdir/Perl6-Subs-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Perl6-Subs-$pkgver"
  make install DESTDIR="$pkgdir/"
}
