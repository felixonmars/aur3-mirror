# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-test-image-gd'
_pkgname='Test-Image-GD'
pkgver='0.03'
pkgrel='1'
pkgdesc="A module for testing images using GD"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/S/ST/STEVAN/$_pkgname-$pkgver.tar.gz)
md5sums=('78dfa441fd0012a9f3cdcacc9a581b7b')

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
