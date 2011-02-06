# Contributor: Link Dupont <link.dupont@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.00
pkgname='perl-math-units'
pkgver='1.3'
pkgrel='1'
pkgdesc="Unit conversion"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Math-Units'
source=('http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/Math-Units-1.3.tar.gz')
md5sums=('3674c769147eacdc0d22957d8288c104')

build() {
  DIST_DIR="${srcdir}/Math-Units-1.3"
  export PERL_AUTOINSTALL=--skipdeps PERL_MM_USE_DEFAULT=1 \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"

  { cd "$DIST_DIR" &&
    perl Makefile.PL &&
    make &&
    make test &&
    make install;
  } || return 1;

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
