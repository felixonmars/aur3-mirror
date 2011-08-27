# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=perl-geo-weathernws
pkgver=1.03
pkgrel=1
pkgdesc="Geo::WeatherNWS"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Geo-WeatherNWS/"
license=("GPL")
depends=('perl-libwww')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSLAGLE/Geo-WeatherNWS-$pkgver.tar.gz")
md5sums=('acb0b0123b938b265c9814758a502c46')

build() {
  cd $startdir/src/Geo-WeatherNWS-$pkgver
  eval `perl -V:archname`
  /usr/bin/perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=$startdir/pkg install
  /usr/bin/find $startdir/pkg -name '.packlist' -delete
  /usr/bin/find $startdir/pkg -name '*.pod' -delete
}

