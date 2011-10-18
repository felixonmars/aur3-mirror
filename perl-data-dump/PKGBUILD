# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.18

pkgname='perl-data-dump'
pkgver='1.21'
pkgrel='1'
pkgdesc="Pretty printing of data structures"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006')
makedepends=()
url='http://search.cpan.org/dist/Data-Dump'
source=('http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Data-Dump-1.21.tar.gz')
md5sums=('5de5616e29fd0626a8a5966a2be85628')
sha512sums=('25a11d3f7b0d075a4bea58848b7b3f4dfde19c8c294632714d674426ea7bb0cdea33ac09ec03d4ba0135ce5ba68bb7072ace93cbd4cb04c17f76f424919fe20b')
_distdir="${srcdir}/Data-Dump-1.21"

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
