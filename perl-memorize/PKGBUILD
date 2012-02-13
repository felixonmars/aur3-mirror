pkgname=perl-memorize
pkgver=1.02
pkgrel=1
pkgdesc="Memoize - Make functions faster by trading space for time"
arch=('any')
url="http://search.cpan.org/~flora/Memoize-1.02/Memoize.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-extutils-makemaker')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Memoize-$pkgver.tar.gz)
md5sums=('ce26dedbc9058490f215106ddbed561d')

build() {
  cd  "$srcdir/Memoize-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
