# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-net-ldap-express'
pkgver='0.11'
pkgrel='1'
pkgdesc="Simplified interface for Net::LDAP"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-perl-ldap')
makedepends=()
url='http://search.cpan.org/dist/Net-LDAP-Express'
source=('http://search.cpan.org/CPAN/authors/id/B/BR/BRONTO/Net-LDAP-Express-0.11.tar.gz')
md5sums=('f236f8aee68b4d2c36f3c0f83117ba1e')
sha512sums=('e836299fcae03770a193e53afed97ae57fd86a895a7aae583109291ea08a13df992f50a655cfabb89f729c23a9412fd1bc93cbc14265b7342d7c7e44e9137701')
_distdir="${srcdir}/Net-LDAP-Express-0.11"

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
