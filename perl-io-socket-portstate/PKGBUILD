pkgname='perl-io-socket-portstate'
pkgver='0.03'
pkgrel='1'
pkgdesc="IO::Socket::PortState - Perl extension for checking the open or closed status of a port"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/perldoc?IO%3A%3ASocket%3A%3APortState'
source=("http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/IO-Socket-PortState-${pkgver}.tar.gz")
md5sums=('ba82446a68380e8bd79ab49a5948d6c1')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "${srcdir}/IO-Socket-PortState-$pkgver" 
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "${srcdir}/IO-Socket-PortState-$pkgver"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "${srcdir}/IO-Socket-PortState-$pkgver"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
