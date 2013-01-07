# Maintainer: Xorxcel <yaourt at web dot de>
pkgname=perl-log-handler
pkgver=0.76
pkgrel=1
pkgdesc="Log messages to several outputs."
arch=(any)
url="http://search.cpan.org/~bloonix/Log-Handler-$pgkver/"
license=('GPL' 'PerlArtistic')
depends=('perl')
source=(http://search.cpan.org/CPAN/authors/id/B/BL/BLOONIX/Log-Handler-$pkgver.tar.gz)
md5sums=('90441d9495f536b23564aa58ddb1c9ab')

build() {
  cd "$srcdir/Log-Handler-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package() {
  cd "$srcdir/Log-Handler-$pkgver"
  make install DESTDIR="$pkgdir" || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}

# vim:set ts=2 sw=2 et:
