# Maintainer: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=perl-term-rawinput
_realname=Term-RawInput
pkgver=1.14
pkgrel=1
pkgdesc="A simple drop-in replacement for STDIN which can capture and return non-standard keys like End, Escape, Insert, etc."
arch=('i686' 'x86_64')
license=('GPL')
depends=('perl>=5.10.0')
url="http://search.cpan.org/~reedfish/Term-RawInput"
source=(http://search.cpan.org/CPAN/authors/id/R/RE/REEDFISH/${_realname}-$pkgver.tar.gz)
options=('!emptydirs')
sha256sums=('dfaadd751a269d1b15aa289276f28916076d1a1e6a25ecf24215c816eed49249')

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
