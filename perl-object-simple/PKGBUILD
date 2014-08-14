# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-object-simple'
pkgver='3.10'
pkgrel='1'
pkgdesc="Simple class builder(Mojo::Base porting)"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Object-Simple'
source=('http://search.cpan.org/CPAN/authors/id/K/KI/KIMOTO/Object-Simple-3.10.tar.gz')
md5sums=('c690418eed1c4686407e5d782106852d')
sha512sums=('c6f4dc99cc6dc4f52e52419fe53d68fada6693e5d3f49d431af207f87f18b82563d08d202a269fe24959c60270a8a353a98def29f00e8248058021dffe41af15')
_distdir="Object-Simple-3.10"

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
