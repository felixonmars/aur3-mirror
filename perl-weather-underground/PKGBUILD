# Maintainer: TDY <tdy@gmx.com>

pkgname=perl-weather-underground
pkgver=3.03
pkgrel=1
pkgdesc="A Perl extension for retrieving weather information from wunderground.com"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Weather-Underground/"
license=('GPL' 'PerlArtistic')
depends=('perl-libwww')
source=(http://search.cpan.org/CPAN/authors/id/M/MN/MNAGUIB/Weather-Underground-$pkgver.tar.gz)
md5sums=('c86a4a807263db55ab30e44c98bcdcac')

build() {
  cd "$srcdir/Weather-Underground-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "$srcdir/Weather-Underground-$pkgver"
  make DESTDIR="$pkgdir" install
}
