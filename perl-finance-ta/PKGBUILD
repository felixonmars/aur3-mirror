# Maintainer:perlawk

pkgname=perl-finance-ta
_pkgname=Finance-TA
pkgver=0.4.1
pkgrel=1
pkgdesc="Finance::TA - Perl wrapper for Technical Analysis Library"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~kmx/Finance-TA-v0.4.1/"
license=('PerlArtistic' 'GPL' 'custom')
depends=( 'perl' 'ta-lib')
options=('!emptydirs')
source=(Finance-TA-v0.4.1.tar.gz)

prepare() {
  cd $srcdir/"$_pkgname"-v$pkgver
	sed -i 's!ta_libc!ta-lib/ta_libc!g;' ta_libc_wrap.c
}

build() {
  cd $srcdir/"$_pkgname"-v$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/"$_pkgname"-v$pkgver
  make install DESTDIR="$pkgdir"
}

md5sums=('e1f9eb6959f2dd968d620ead34152ec4')
