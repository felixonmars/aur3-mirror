pkgname=perl-crypt-lite
pkgver=0.82.11
pkgrel=1
pkgdesc="Easy to use symmetric data encryption and decryption"
arch=('any')
url="http://search.cpan.org/~retoh/Crypt-Lite-0.82.11/lib/Crypt/Lite.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-digest-md5' 'perl-md5')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/R/RE/RETOH/Crypt-Lite-$pkgver.tar.gz)
md5sums=('308a3303a468f3749ef4d1d5def5a7a2')

build() {
  cd  "$srcdir/Crypt-Lite-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}