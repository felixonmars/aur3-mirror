# Contributor: Erik Johnson <palehose at gmail dot com>
pkgname='perl-user-utmp'
pkgver='1.8'
pkgrel='1'
pkgdesc="Perl access to utmp- and utmpx-style databases"
arch=('any')
url="http://search.cpan.org/~mpiotr/User-Utmp-${pkgver}"
license=('PerlArtistic' 'GPL')
depends=('perl')

options=('!emptydirs')

source=("http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/User-Utmp-${pkgver}.tar.gz")
md5sums=('e3561ae2b07f08b0c754bc351e810551')

build() {
  DIST_DIR="${srcdir}/User-Utmp-${pkgver}"
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

