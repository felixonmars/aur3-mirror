# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-dbix-class-journal'
pkgver='0.900200'
pkgrel='1'
pkgdesc="Auditing for tables managed by DBIx::Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-c3-componentised>=1.0006' 'perl-dbix-class>=0.08115' 'perl-dbix-class-timestamp>=0.13' 'perl>=5.8.1')
makedepends=('perl-dbd-sqlite>=1.29' 'perl-sql-translator>=0.11003')
url='http://search.cpan.org/dist/DBIx-Class-Journal'
source=('http://search.cpan.org/CPAN/authors/id/F/FR/FREW/DBIx-Class-Journal-0.900200.tar.gz')
md5sums=('df6750d21ee4af5373509c07dcaff9ce')
sha512sums=('ab218b42081fe3063c74465380af26238800d22381d32b177474fe9e5da1d6eaefc14558e76263b66065a2982e1d830e6460012f659cd5a6925ed14a196fe7ab')
_distdir="DBIx-Class-Journal-0.900200"

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
