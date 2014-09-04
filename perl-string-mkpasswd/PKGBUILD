# Maintainer: Naoki Kawakami <nkawakami atto parallels dotto com>
# Module author: Chris Grau
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-string-mkpasswd'
pkgver='0.05'
pkgrel='1'
pkgdesc="Random password generator"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.6.1')
makedepends=()
url='http://search.cpan.org/dist/String-MkPasswd'
source=('http://search.cpan.org/CPAN/authors/id/C/CG/CGRAU/String-MkPasswd-0.05.tar.gz')
md5sums=('ebc243f16c598a38aceaaeb593d9f745')
sha512sums=('7618250460fa8db2298f73ab458582d1f1dc66b4188f8ad2b7e85e7b0fd3a491f82909b9645be06ec14389ae2e33f0e5bd59985ee0a481c7294bfdccc33deed7')
_distdir="String-MkPasswd-0.05"

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
