# CPAN Name  : Apache2-AuthPAM

pkgname='perl-apache2-authpam'
pkgver='0.01'
pkgrel='1'
pkgdesc="Authenticate apache request using PAM services"
arch=('any')
url="http://search.cpan.org/~timb/Apache2-AuthPAM-$pkgver/"
license=('unknown')
depends=('perl')

options=('!emptydirs')

source=("http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/Apache2-AuthPAM-$pkgver.tar.gz")
md5sums=('6c75131543459b4a6ff0031518d1fdc5')

build() {
  DIST_DIR="${srcdir}/Apache2-AuthPAM-$pkgver"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1
  {
    cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
