# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-sms-send
pkgver=1.06
pkgrel=1
pkgdesc="Driver-based API for sending SMS messages"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/SMS-Send/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/SMS-Send-${pkgver}.tar.gz")
md5sums=('bf8c79fb145883c3cd475e5687201151')

build() {
  cd $srcdir/SMS-Send-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/SMS-Send-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
