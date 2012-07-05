# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-plack-middleware-nomultipleslashes'
pkgver='0.001'
pkgrel='1'
pkgdesc="Remove multiple slashes in your paths automatically"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-http-message' 'perl-plack')
url='http://search.cpan.org/dist/Plack-Middleware-NoMultipleSlashes'
source=('http://search.cpan.org/CPAN/authors/id/X/XS/XSAWYERX/Plack-Middleware-NoMultipleSlashes-0.001.tar.gz')
md5sums=('aa57656dfceb8e9db91e0a65b50c1080')
sha512sums=('fd450cac59248e4209be9525cae788089bb947bf843f6c6d719a12d182d4f678a722b0f279032170234ff8da85860276fe8410c07902fa0051dcc50d4b143f6a')
_distdir="${srcdir}/Plack-Middleware-NoMultipleSlashes-0.001"

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
