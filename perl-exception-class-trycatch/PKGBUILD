# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-exception-class-trycatch'
pkgver='1.12'
pkgrel='1'
pkgdesc="Syntactic tryE<sol>catch sugar for use with Exception::Class"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-exception-class>=1.2')
makedepends=()
url='http://search.cpan.org/dist/Exception-Class-TryCatch'
source=('http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Exception-Class-TryCatch-1.12.tar.gz')
md5sums=('d9943ce5e251437312a11001b9531f43')
sha512sums=('c5765c94ef643a78dd08072df47318c409f7a30055b07b7ec652a41c0dcd75bc522d883302c36f86fd1bfc3ef6b45b24f060826f6ce3b3e616e40848db53382d')
_distdir="Exception-Class-TryCatch-1.12"

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
