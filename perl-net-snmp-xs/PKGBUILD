# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-net-snmp-xs'
pkgver='1.2'
pkgrel='1'
pkgdesc="speed up Net::SNMP by decoding in XS, with limitations"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-guard>=1' 'perl-net-snmp')
makedepends=()
url='http://search.cpan.org/dist/Net-SNMP-XS'
source=('http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Net-SNMP-XS-1.2.tar.gz')
md5sums=('a13764196d0d4e30c57e1732a4815f73')
sha512sums=('309a0caa5f34db6c661208083b689b73c93af74a65f99d46385163b4f9c5e16bbb833b8f494be9b3b5ad9a8f8e5908fc620519934f993d5507bc8bb251d2e96e')
_distdir="Net-SNMP-XS-1.2"

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
