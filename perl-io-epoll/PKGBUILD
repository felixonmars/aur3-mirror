# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-io-epoll'
pkgver='0.03'
pkgrel='1'
pkgdesc="Scalable IO Multiplexing for Linux 2.5.44 and higher"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/IO-Epoll'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRUCEK/IO-Epoll-0.03.tar.gz')
md5sums=('b2a1aff49230846ed8f67761f33ab67b')
sha512sums=('afb50e5e9c8bb13f16e7875ab6392fb50f0c8a79100a46b8489ee0be5f59972543ae16f4cb183ceb419c69b736eb58e0c63f34065f9b92adc9a8e5aaeb10c629')
_distdir="IO-Epoll-0.03"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
