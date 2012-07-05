# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname='perl-plack-builder-conditionals'
pkgver='0.03'
pkgrel='1'
pkgdesc="Plack::Builder extension"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-list-moreutils' 'perl-net-cidr-lite' 'perl-plack>=0.9941')
makedepends=()
url='http://search.cpan.org/dist/Plack-Builder-Conditionals'
source=('http://search.cpan.org/CPAN/authors/id/K/KA/KAZEBURO/Plack-Builder-Conditionals-0.03.tar.gz')
md5sums=('045452b130d2d3d2adf230fa9716daae')
sha512sums=('d4f16eefc44ac66fbdaf77fbe7f36812daf5dbc618ea59dce56bb085be4088f6e51300deb8124cf795e33682092bacdf257bfcd69c1932ee7c35182eb13d3acb')
_distdir="${srcdir}/Plack-Builder-Conditionals-0.03"

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
