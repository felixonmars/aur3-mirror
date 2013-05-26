# Contributor: Mateusz Krasowski <matkras@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-autobox-list-util'
pkgver='20090629'
pkgrel='1'
pkgdesc="bring the List::Util functions to autobox"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-autobox')
url='http://search.cpan.org/dist/autobox-List-Util'
source=('http://search.cpan.org/CPAN/authors/id/C/CO/COWENS/autobox-List-Util-20090629.tar.gz')
md5sums=('b7e1d41601c306483b6125fab69d9d1f')
sha512sums=('391cc94624ff159e7aefe7857e0f5512f0a4bb44591f28e0a3cae81eacd0ca6e994120aa4b0100cb61067785a1710a6b6bebdafc0fb456f316005fda361825c2')
_distdir="autobox-List-Util-20090629"

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
