# Created by Yuval Hager <yhager@yhager.com>
pkgname=perl-schedule-at
pkgver=1.15
pkgrel=1
pkgdesc="OS independent interface to the Unix 'at' command"
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Schedule-At/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.12')
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/J/JO/JOSERODR/Schedule-At-${pkgver}.tar.gz")
md5sums=('218b42b6ad2a2c2ddb0d54aeb0921496')

build() {
  cd $srcdir/Schedule-At-$pkgver
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
package() {
  cd $srcdir/Schedule-At-$pkgver
  make install DESTDIR="${pkgdir}"
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
# vim:set ts=2 sw=2 et:
