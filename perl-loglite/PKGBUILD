# Contributor: Marcos Riosalido mriosalido at gmail dot com
pkgname=perl-loglite
pkgver=0.82
pkgrel=1
pkgdesc="Class helps us create simple logs for our application."
arch=("i686" "x86_64")
url="http://search.cpan.org/~rani/Log-LogLite-0.82/"
license=("Free software")
source=("http://search.cpan.org/CPAN/authors/id/R/RA/RANI/Log-LogLite-0.82.tar.gz")
md5sums=("67e72da51df7423c028b4dc0186f5f52")
depends=("perl-io-lockedfile")

build() {
  cd ${srcdir}/Log-LogLite-$pkgver
  /usr/bin/perl Makefile.PL \
      INSTALLARCHLIB=/usr/lib/perl5/current/${archname} \
      INSTALLSITELIB=/usr/lib/perl5/site_perl/current \
      INSTALLSITEARCH=/usr/lib/perl5/site_perl/current/${archname}
  /usr/bin/make || return 1
  /usr/bin/make DESTDIR=${pkgdir} install
  /usr/bin/find ${pkgdir} -name '.packlist' -delete
  /usr/bin/find ${pkgdir} -name '*.pod' -delete
}
