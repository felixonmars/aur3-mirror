pkgname='perl-sql-library'
pkgver='0.0.3'
pkgrel='1'
pkgdesc="A module for managing simple SQL libraries stored in INI-like files."
arch=('any')
url='http://search.cpan.org/~dgorley/SQL-Library-0.0.3/lib/SQL/Library.pm'
license=('PerlArtistic' 'GPL')
depends=('perl')

options=('!emptydirs')

source=('http://search.cpan.org/CPAN/authors/id/D/DG/DGORLEY/SQL-Library-0.0.3.tar.gz')
md5sums=('75b80cb27775bb61f90fbd5b835032ec')

build() {
  DIST_DIR="${srcdir}/SQL-Library-0.0.3"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  {
	cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="$pkgdir" install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete

}

