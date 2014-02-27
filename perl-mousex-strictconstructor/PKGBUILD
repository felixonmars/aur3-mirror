# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-mousex-strictconstructor'
pkgver='0.02'
pkgrel='1'
pkgdesc="Make your object constructors blow up on unknown attributes "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mouse>=0.62' 'perl>=5.6.2')
makedepends=()
url='http://search.cpan.org/dist/MouseX-StrictConstructor'
source=('http://search.cpan.org/CPAN/authors/id/G/GF/GFUJI/MouseX-StrictConstructor-0.02.tar.gz')
md5sums=('cb4321d832c2ef3a613969cb205d9523')
sha512sums=('474e38beecc0fcc8371282b7734c0f8516f51a235e11d531b870a05f6f667d9451b3bb4e5777d10ec5a984f93baf75099700bbd2bc3ef7e35d8725bb8388cd08')
_distdir="MouseX-StrictConstructor-0.02"

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
