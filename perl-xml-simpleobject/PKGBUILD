# Maintainer: Moritz Bunkus <moritz@bunkus.org>
pkgname='perl-xml-simpleobject'
pkgver='0.53'
pkgrel='1'
pkgdesc="simple object representation of a parsed XML::Parser tree"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-xml-parser' 'perl-xml-libxml')
conflicts=('perl-xml-simpleobject-libxml')
replaces=('perl-xml-simpleobject-libxml')
url='http://search.cpan.org/dist/XML-SimpleObject'
source=('http://search.cpan.org/CPAN/authors/id/D/DB/DBRIAN/XML-SimpleObject-0.53.tar.gz')
md5sums=('7826c2f27c36b90bfe731e0001da1021')
sha512sums=('c1ef01039f283f8cb833abf43e7789b05fd2701ca8438bce5088ddb1dafdc52f82e8d1b51b90fb39df5342fb728af521cc80a0e1c1b5b8f3d45a6a4fddf16434')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/XML-SimpleObject0.53"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "${srcdir}/XML-SimpleObject0.53"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
  make test
}

package() {
  cd "${srcdir}/XML-SimpleObject0.53"
  make install
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
