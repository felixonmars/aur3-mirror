# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-fcgi-restarter'
pkgver='0.12'
pkgrel='1'
pkgdesc="Restart FCGI process on the fly"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-class-accessor-tiny>=0.10' 'perl-fcgi>=0.67' 'perl>=5.8.1')
makedepends=()
url='http://search.cpan.org/dist/FCGI-Restarter'
source=('http://search.cpan.org/CPAN/authors/id/G/GR/GRIAN/FCGI-Restarter-0.12.tar.gz')
md5sums=('69f59a7e727e22a0cae2ace395495443')
sha512sums=('83d8f4670233253023e50252d1cd6b83a8000f43a0e85619d52e1082faa020d00e723304bc194b1bc435d4c0e0eedaeed39ff96b5938aad9e164fe67b340c2d0')
_distdir="FCGI-Restarter-0.12"

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
