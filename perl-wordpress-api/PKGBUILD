# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-wordpress-api'
pkgver='1.10'
pkgrel='1'
pkgdesc=""
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-date-manip>=5' 'perl-file-type>=0.22' 'perl-leocharre-debug>=1' 'perl-smart-comments>=1' 'perl-wordpress-xmlrpc>=1.17' 'perl-yaml>=0')
makedepends=()
url='http://search.cpan.org/dist/WordPress-API'
source=('http://search.cpan.org/CPAN/authors/id/L/LE/LEOCHARRE/WordPress-API-1.10.tar.gz')
md5sums=('5cd5666a897aa17315c538836fd55fe0')
sha512sums=('b9168a7816b3e28159b341937519a1995d4f8c61b5adba4879a9befe8f646b1161baee642ab14de28aceec0d18a6dc5a491bbd3cfd7fde0f1520f8f38482e7b3')
_distdir="WordPress-API-1.10"

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
