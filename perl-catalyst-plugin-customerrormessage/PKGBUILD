# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-catalyst-plugin-customerrormessage'
_pkgname='Catalyst-Plugin-CustomErrorMessage'
pkgver='0.06'
pkgrel='1'
pkgdesc='Catalyst plugin to have more "cute" error message'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/J/JK/JKUTEJ/$_pkgname-$pkgver.tar.gz)
md5sums=('21b4f765558d3a842381f7121297fa40')

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir"/$_pkgname-$pkgver

    /usr/bin/perl Makefile.PL

    make
  )
}

check() {
  cd "$srcdir"/$_pkgname-$pkgver

  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir"/$_pkgname-$pkgver

  make install
}
