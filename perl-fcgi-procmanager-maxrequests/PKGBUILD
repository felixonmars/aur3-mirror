# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-fcgi-procmanager-maxrequests'
_pkgname='FCGI-ProcManager-MaxRequests'
pkgver='0.02'
pkgrel='1'
pkgdesc="Restrict max number of requests by each child"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/V/VO/VOVKASM/$_pkgname-$pkgver.tar.gz)
md5sums=('2afa746a1eab6b26d4b2111b4e3feb0b')

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
