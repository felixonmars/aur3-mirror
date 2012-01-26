pkgname=perl-mime-lite-tt
pkgver=0.02
pkgrel=1
pkgdesc="MIME::Lite::TT - TT enabled MIME::Lite wrapper"
arch=('any')
url="http://search.cpan.org/~horiuchi/MIME-Lite-TT-0.02/lib/MIME/Lite/TT.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-mime-lite' 'perl-template-toolkit')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/H/HO/HORIUCHI/MIME-Lite-TT-$pkgver.tar.gz")
md5sums=('82ac8e6dd4b0274ce552d5d2ace23eb4')

build() {
  cd  "$srcdir/MIME-Lite-TT-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}