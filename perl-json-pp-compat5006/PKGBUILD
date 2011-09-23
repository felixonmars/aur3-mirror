# Maintainer: Anonymous

pkgname=perl-json-pp-compat5006
pkgver=1.09
pkgrel=1
pkgdesc="Helper module in using JSON::PP in Perl 5.6"
arch=(any)
license=(GPL)
depends=('perl')
url=http://search.cpan.org/dist/JSON-PP-Compat5006
source=('http://search.cpan.org/CPAN/authors/id/M/MA/MAKAMAKA/JSON-PP-Compat5006-1.09.tar.gz')
md5sums=(b6a67ab02e8da76ba718b2464bb5fbd5)
sha512sums=(e3f86073a84e6f2555ef707f7f5c4e90c45a76fc242756d080e01da30a350aab490140e8d9f7f42545b6d05cd765bf3bec072e29a689d6c95042d6e6266c892c)
_distdir="${srcdir}/JSON-PP-Compat5006-${pkgver}"

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
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    cd "$_distdir"
    make test
  )
}

package() {
    cd "$_distdir"
    make DESTDIR="$pkgdir" install
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
