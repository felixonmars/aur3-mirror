# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-lingua-en-findnumber'
pkgver='1.2'
pkgrel='1'
pkgdesc="Locate (written) numbers in English text "
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-lingua-en-words2nums>=0')
makedepends=()
url='http://search.cpan.org/dist/Lingua-EN-FindNumber'
source=('http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/Lingua-EN-FindNumber-1.2.tar.gz')
md5sums=('d071ffb8100dcd2f7393eb356265ce3c')
sha512sums=('d3fe0483c309a6d059b4d7743f65a15d4698ac5c6b8a5ddff1d1d53cb0b57decb46ab4bf93d5148faff35cf9a8e03277b38a298e8d3f325d0a2ab7c00f7358e6')
_distdir="Lingua-EN-FindNumber-1.2"

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
