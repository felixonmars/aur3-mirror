# Maintainer: MrMen <tetcheve@gmail.com>
_author="BKB"
_perlmod=JSON-Parse
pkgname=perl-json-parse
pkgver=0.30
pkgrel=1
pkgdesc="Convert JSON into a Perl variable"
arch=('x86_64' 'i686')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/B/BK/$_author/${_perlmod}-${pkgver}.tar.gz)
md5sums=('5b7848a694ef4041661c632dfe6f2a5b')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
