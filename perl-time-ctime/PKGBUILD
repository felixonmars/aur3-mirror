# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: zlowly <zlowly@gmail.com>

pkgname=perl-time-ctime
pkgver=2011.0517
_realname=Time-modules
pkgrel=2
pkgdesc="Perl module for formatting times ala POSIX asctime"
arch=('any')
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
url="http://search.cpan.org/~muir/Time-modules/"
source=(http://search.cpan.org/CPAN/authors/id/M/MU/MUIR/modules/${_realname}-${pkgver}.tar.gz)
md5sums=('67204ebc06211a877665765f91dc4e51')

build() {
  cd ${_realname}-${pkgver}
  perl Makefile.PL INSTALLDIRS=vendor 
  make
}
check() {
  cd ${_realname}-${pkgver}
  make test
}
package(){  
  cd ${_realname}-${pkgver}
  make install DESTDIR=${pkgdir} 
}
