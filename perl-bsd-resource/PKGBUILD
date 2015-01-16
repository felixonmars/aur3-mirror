# Contributor: senorsmile
# Contributor: Max Roder <maxroder@web.de>
# Generator  : CPANPLUS::Dist::Arch 1.19

pkgname='perl-bsd-resource'
pkgver='1.2907'
pkgrel='1'
pkgdesc="getrusage(), s/getrlimit(), s/getpriority()"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=()
url='http://search.cpan.org/dist/BSD-Resource'
source=("http://search.cpan.org/CPAN/authors/id/J/JH/JHI/BSD-Resource-${pkgver}.tar.gz")
md5sums=('3d178cd01701a8a462d9478284d99813')
sha512sums=('1e7c574d1f4e568503cf116ea35ba787c6f3bba02cf4b910196dfbb2ee6f147587f1021f28f7411272485b28ec65d78c5d79aa7c60340af97c8144d4c25b140d')
_distdir="BSD-Resource-${pkgver}"


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
