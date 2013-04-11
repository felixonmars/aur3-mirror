# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=perl-term-menus
_realname=Term-Menus
pkgver=2.25
pkgrel=1
pkgdesc="Term::Menus - Create Powerful Terminal, Console and CMD Enviroment Menus"
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl>=5.10.0' 'perl-term-rawinput' 'perl-term-readkey' 'perl-data-dump-streamer>=2.34')
url="http://search.cpan.org/~reedfish/Term-Menus"
source=(http://search.cpan.org/CPAN/authors/id/R/RE/REEDFISH/${_realname}-$pkgver.tar.gz)
options=('!emptydirs')
sha256sums=('9b02542bbd436d188a169e3d8b94fa7206cf01f951d7baf0b2807ce13b48017d')

build()
{
  cd ${srcdir}/$_realname-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor
  make
  make test
}

package() {
  cd ${srcdir}/$_realname-$pkgver
  make DESTDIR=${pkgdir} install
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  install LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
