# Maintainer:perlawk

pkgname=perl-ta-lib
pkgver=0.4.0
pkgrel=1
pkgdesc="Finance::TA - Perl wrapper for Technical Analysis Library"
arch=(any)
url="https://github.com/kmx/perl-finance-ta"
license=('PerlArtistic' 'GPL' 'custom')
depends=('ta-lib' 'perl')

prepare() {
	if [ ! -e "$srcdir"/perl-finance-ta ] ; then
		git clone https://github.com/kmx/perl-finance-ta.git
	fi
}

build() {
  cd "$srcdir"/perl-finance-ta
	TALIB_CFLAGS='-I/usr/include/ta-lib' TALIB_LIBS='-L/usr/lib -lta_lib' \
  perl Makefile.PL 
  make
}

package() {
  cd "$srcdir"/perl-finance-ta
  make install DESTDIR="$pkgdir"
}
