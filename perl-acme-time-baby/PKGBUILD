# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-acme-time-baby'
pkgver='2010090301'
pkgrel='1'
pkgdesc="Tell time little children can understand"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Acme-Time-Baby'
source=('http://search.cpan.org/CPAN/authors/id/A/AB/ABIGAIL/Acme-Time-Baby-2010090301.tar.gz')
md5sums=('dfd072971082bcf6eeacf28c2c9e9b01')
sha512sums=('9f10b11e1dd2f5582416a07a08871b574c844212719277bb8835a116b84c33bbdef854af5698ce0e5a208d82bc43903a66058d20455bd01693cf69cc171322bc')
_distdir="${srcdir}/Acme-Time-Baby-2010090301"

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
