# Contributor: atie H. <atie.at.matrix@gmail.com>

pkgname=perl-datetime-calendar-julian
pkgver=0.04
pkgrel=1
pkgdesc="DateTime::Calendar::Julian"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~pijll/DateTime-Calendar-Julian-0.04/"
license=("GPL")
depends=('perl-datetime')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/P/PI/PIJLL/DateTime-Calendar-Julian-$pkgver.tar.gz")
md5sums=('de688324eb33a27449ac2a5bfe1453a0')

build() {
  cd $startdir/src/DateTime-Calendar-Julian-$pkgver
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

