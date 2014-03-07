# Maintainer:perlawk

pkgname=perl-beancounter
_pkgname=beancounter
pkgver=0.8.10
pkgrel=1
pkgdesc="BeanCounter -- A stock portfolio performance monitoring tool"
arch=('i686' 'x86_64')
url="http://dirk.eddelbuettel.com/code/beancounter.html"
license=('PerlArtistic' 'GPL' 'custom')
depends=( 'perl' 'perl-yahooquote' 'perl-statistics-descriptive')
options=('!emptydirs')
source="http://dirk.eddelbuettel.com/code/beancounter/beancounter-current.tar.gz"

prepare() {
  cd $srcdir/"$_pkgname"-$pkgver
}

build() {
  cd $srcdir/"$_pkgname"-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/"$_pkgname"-$pkgver
  make install DESTDIR="$pkgdir"
}

md5sums=('f7ece6b5b46fccea8b25622419a630a2')
