pkgname=perl-test-www-selenium
pkgver=1.35
pkgrel=1
pkgdesc="Test applications using Selenium Remote Control"
arch=('any')
url="http://search.cpan.org/dist/Test-WWW-Selenium/"
license=('PerlArtistic')
depends=('perl-libwww' 'perl-uri')
makedepends=('perl-extutils-makemaker' 'perl-test-exception' 'perl-test-mock-lwp' 'perl-test-simple' 'perl-test-pod')
provides=('perl-www-selenium-util' 'perl-www-selenium-xmlparseutils' 'perl-www-selenium')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/MA/MATTP/Test-WWW-Selenium-$pkgver.tar.gz")
md5sums=('7d73b5340231a1ad62e6d0643376f116')

build() {
  cd $srcdir/Test-WWW-Selenium-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
