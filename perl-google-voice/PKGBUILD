# Contributor: Joe Carta <cartakid at gmail dot com>
# Generator  : CPANPLUS::Dist::Arch 1.28

pkgname='perl-google-voice'
pkgver='0.06'
pkgrel='1'
pkgdesc="Easy interface for google voice"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-io-socket-ssl>=1.37' 'perl-mojolicious>=0')
makedepends=()
url='http://search.cpan.org/dist/Google-Voice'
source=('http://search.cpan.org/CPAN/authors/id/T/TE/TEMPIRE/Google-Voice-0.06.tar.gz')
md5sums=('e692f0cc0c140e54e530ca53037f4714')
sha512sums=('77638d657f3f577b0d827aa91cebfb462cebb7c5fa7257527dff0b0a9634c8edff156ec8362c7d0454bff281ad8dc1918257dd57fbee0d92531ffa79e908c074')
_distdir="Google-Voice-0.06"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"

    sed -i 's/attrs/attr/g' ./lib/Google/Voice/Feed.pm ./lib/Google/Voice.pm

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
