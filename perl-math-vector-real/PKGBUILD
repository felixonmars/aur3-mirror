# Maintainer: xorxcel <yaourt at web dot de>
_author="salva"
_perlmod="Math-Vector-Real"

pkgname=perl-math-vector-real
pkgver=0.11
pkgrel=2
pkgdesc="Real vector arithmetic in Perl."
arch=(any)
url="http://search.cpan.org/~$_author/$_perlmod-$pgkver/"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/S/SA/SALVA/$_perlmod-$pkgver.tar.gz)
md5sums=('0df6e716387719f293c09bec84c720af')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

check() {
  cd "$srcdir/$_perlmod-$pkgver"

  make test || return 1
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"

  make install DESTDIR="$pkgdir" || return 1

  find "$pkgdir" -name '.packlist' -delete
}

# vim:set ts=2 sw=2 et:
