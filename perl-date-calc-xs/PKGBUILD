# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-date-calc-xs'
_pkgname='Date-Calc-XS'
pkgver='6.3'
pkgrel='1'
pkgdesc="XS wrapper and C library plug-in for Date::Calc"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/S/ST/STBEY/$_pkgname-$pkgver.tar.gz)
md5sums=('ea431e7d9f3e271bbaa9cbf38261cb7f')

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
