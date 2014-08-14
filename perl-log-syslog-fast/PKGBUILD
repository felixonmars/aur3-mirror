# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-log-syslog-fast'
pkgver='0.61'
pkgrel='1'
pkgdesc="Perl extension for sending syslog messages over TCP, UDP,"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-log-syslog-constants>=1.01')
makedepends=()
url='http://search.cpan.org/dist/Log-Syslog-Fast'
source=('http://search.cpan.org/CPAN/authors/id/A/AT/ATHOMASON/Log-Syslog-Fast-0.61.tar.gz')
md5sums=('2c85c507823eb1c821496b53bc4e7495')
sha512sums=('02ab46ac37302b728db6d8f9cbb0bed5798b4e5be24e03dc8c20dbd65270beeca8f5b180a007b476e8164c824eb83a41fb9f5e6a05a75ab177e2a099c32f4159')
_distdir="Log-Syslog-Fast-0.61"

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
