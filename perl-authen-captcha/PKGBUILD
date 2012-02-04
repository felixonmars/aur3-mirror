pkgname=perl-authen-captcha
pkgver=1.023
pkgrel=1
pkgdesc="Authen::Captcha - Perl extension for creating captcha's to verify the human element in transactions."
arch=('any')
url="http://search.cpan.org/~unrtst/Authen-Captcha-1.023/Captcha.pm"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-digest-md5' 'perl-gd')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/U/UN/UNRTST/Authen-Captcha-$pkgver.tar.gz)
md5sums=('7c20090844dd2406e4ef6a894c66348b')

build() {
  cd  "$srcdir/Authen-Captcha-$pkgver" || return 1

  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor &&
  make &&
  make DESTDIR="$pkgdir" install || return 1

  find "$pkgdir" -name '.packlist' -delete
  find "$pkgdir" -name '*.pod' -delete
}
