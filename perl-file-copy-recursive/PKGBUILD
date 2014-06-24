# Maintainer: jsteel <jsteel at aur.archlinux.org>

pkgname='perl-file-copy-recursive'
_pkgname='File-Copy-Recursive'
pkgver='0.38'
pkgrel='1'
pkgdesc="Extension for recursively copying files and directories"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
url="http://search.cpan.org/dist/$_pkgname"
source=(http://search.cpan.org/CPAN/authors/id/D/DM/DMUEY/$_pkgname-$pkgver.tar.gz)
md5sums=('e76dc75ab456510d67c6c3a95183f72f')

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
