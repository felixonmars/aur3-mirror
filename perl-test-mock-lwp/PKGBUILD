pkgname=perl-test-mock-lwp
pkgver=0.50.0
pkgrel=2
pkgdesc="CPAN package (no description found)"
arch=('i686 x86_64')
url="http://search.cpan.org/dist/Test-Mock-LWP/"
license=('perl')
depends=('perl-test-mockobject')
makedepends=('perl')
provides=('perl-test-mock-http-request=0.10.0' 'perl-test-mock-http-response=0.10.0'
	  'perl-test-mock-lwp-useragent=0.10.0')
options=(!emptydirs)
source=('http://search.cpan.org/CPAN/authors/id/L/LU/LUKEC/Test-Mock-LWP-0.05.tar.gz')
md5sums=('2496324cd4474966269847836770b7a0')

build() {
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make 
    make install DESTDIR="${pkgdir}"
  else
  _dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
  if [ ! -z "$_dir" ]; then
    cd $(dirname "$_dir")
    PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor
    ./Build 
    ./Build install destdir=${pkgdir}
  else
    echo "error: failed to detect build method for $pkgname"
    echo "you may be able to fix this by editing the PKGBUILD"
    return 1
  fi fi

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
