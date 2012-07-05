# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-plack-middleware-crossorigin'
pkgver='0.007'
pkgrel='1'
pkgdesc="Adds headers to allow Cross-Origin Resource Sharing"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-plack')
makedepends=()
url='http://search.cpan.org/dist/Plack-Middleware-CrossOrigin'
source=('http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/Plack-Middleware-CrossOrigin-0.007.tar.gz')
md5sums=('4c7b13618b53dd176f7282748205a80e')
sha512sums=('ca38818bdeb9172dc9c6672c4ba6d0eb73487be8a391a3844b871e6e2793aab07d969484bdf15c7d404355bf5d8dc611d01092c0f75de7d3fd6311f099ddbce5')
_distdir="${srcdir}/Plack-Middleware-CrossOrigin-0.007"

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
