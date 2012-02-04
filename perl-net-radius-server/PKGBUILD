# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.12

pkgname='perl-net-radius-server'
pkgver='1.116'
pkgrel='2'
pkgdesc="Framework for RADIUS Servers"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-authen-pam' 'perl-berkeleydb' 'perl-class-accessor>=0.27' 'perl-file-find-rule' 'perl-io-async' 'perl-io-prompt' 'perl-mldbm-sync' 'perl-net-radius' 'perl-net-server>=0.94' 'perl-netaddr-ip>=4' 'perl-perl-ldap' 'perl-statistics-descriptive' 'perl-time-stopwatch' 'perl-yaml-syck')
makedepends=('perl-test-file-contents')
url='http://search.cpan.org/dist/Net-Radius-Server'
source=('http://search.cpan.org/CPAN/authors/id/L/LU/LUISMUNOZ/Net-Radius-Server-1.116.tar.gz' 'net-radius-server-fix-constant-export.patch')
md5sums=('df88a7819d902f455494f59756fea3ec'
         'a2be97b34dd571ebfc05e807c2ab757b')
_distdir="${srcdir}/Net-Radius-Server-1.116"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$_distdir"
    patch -p1 < ${srcdir}/net-radius-server-fix-constant-export.patch
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
