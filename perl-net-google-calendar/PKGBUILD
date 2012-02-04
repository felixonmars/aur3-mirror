# Contributor:  Haoyu Bai <baihaoyu@gmail.com>
pkgname=perl-net-google-calendar
pkgver=0.94
pkgrel=1
pkgdesc="Perl/CPAN module Net::Google::Calendar"
url="http://search.cpan.org/~simonw/Net-Google-Calendar/"
depends=('perl-libwww' 'perl-datetime' 'perl-net-google-authsub' 'perl-xml-atom')
license="GPL"
options=('!emptydirs')
arch=('i686' 'x86_64')
source=(http://search.cpan.org/CPAN/authors/id/S/SI/SIMONW/Net-Google-Calendar-$pkgver.tar.gz) 
md5sums=('61bceb8f57f6a879bf3d6481d64d2867')

build() {
  cd  $startdir/src/Net-Google-Calendar-$pkgver
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
