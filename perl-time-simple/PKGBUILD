# Contributor: Anonymous
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-time-simple'
pkgver='0.06'
pkgrel='1'
pkgdesc="A simple, light-weight ISO 8601 time object."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=0')
makedepends=()
url='http://search.cpan.org/dist/Time-Simple'
source=('http://search.cpan.org/CPAN/authors/id/L/LG/LGODDARD/Time-Simple-0.06.tar.gz')
md5sums=('503a47b2c274c93e70fe13bc7922195e')
sha512sums=('eb3aa3795f7c666d29c3c67e5f7a5e0a3f22b2259be639d114dbb5c863e5691afe06a022100e94288678c38f7ffa8020ea76186d6c3174e9704c7f934393df42')
_distdir="Time-Simple-0.06"

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
