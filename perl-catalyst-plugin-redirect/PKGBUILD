# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-catalyst-plugin-redirect'
_pkgname='Catalyst-Plugin-Redirect'
pkgver='0.02'
pkgrel='1'
pkgdesc="Redirect for Catalyst used easily is offered"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/S/SH/SHOT/$_pkgname-$pkgver.tar.gz)
md5sums=('186b63a36583cf68a036d1da1e6d7ea1')

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
