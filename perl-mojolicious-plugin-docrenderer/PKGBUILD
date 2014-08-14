# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-mojolicious-plugin-docrenderer'
pkgver='4.00'
pkgrel='1'
pkgdesc="Doc Renderer Plugin"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-mojolicious>=4.99')
makedepends=()
url='http://search.cpan.org/dist/Mojolicious-Plugin-DOCRenderer'
source=('http://search.cpan.org/CPAN/authors/id/E/EX/EXC/Mojolicious-Plugin-DOCRenderer-4.00.tar.gz')
md5sums=('1b82024bfa05f729428f62cfc2c8bcb0')
sha512sums=('4fe86134f4157a08ecb6d035fd81e45734db062b212197874e2f808c8505581d2f1db29e0e7d4907a103e916b6e0cff44e3b984e82342ee5b8fcbbadb8239bb9')
_distdir="Mojolicious-Plugin-DOCRenderer-4.00"

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
