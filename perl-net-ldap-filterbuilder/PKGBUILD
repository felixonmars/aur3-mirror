# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-net-ldap-filterbuilder'
pkgver='1.0004'
pkgrel='1'
pkgdesc="Build LDAP filter statements"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-extutils-makemaker>=6.6302' 'perl-test-pod' 'perl-test-pod-coverage')
url='http://search.cpan.org/dist/Net-LDAP-FilterBuilder'
source=('http://search.cpan.org/CPAN/authors/id/O/OL/OLIVER/Net-LDAP-FilterBuilder-1.0004.tar.gz')
md5sums=('fba793a9859ec869d7fface9f37eca91')
sha512sums=('bd034e4507819c2f26bb0bd9e37146929549bf520417a4d8c11b08faa3d4ff3d3a27766bd7d5a3e17a681578ca3c76d105422fe4c86f15c4a58fdb5e795295c2')
_distdir="${srcdir}/Net-LDAP-FilterBuilder-1.0004"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$_distdir"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
