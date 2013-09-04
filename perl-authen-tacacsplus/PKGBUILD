# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-authen-tacacsplus'
pkgver='0.24'
pkgrel='1'
pkgdesc="Authentication on tacacs+ server"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/Authen-TacacsPlus'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIKEM/Authen-TacacsPlus/Authen-TacacsPlus-0.24.tar.gz')
md5sums=('8c6bcd4bb20a906854672f2705119626')
sha512sums=('f6f625dc8fa0f67045a20d77530d8cb2fd0ce00058da6526553efe3efc5d737c26a654b78699851573542a8b21efcb67a36bb2e9946b4da7cca720f4530c8469')
_distdir="Authen-TacacsPlus-0.24"

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
