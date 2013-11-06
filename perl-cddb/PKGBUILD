# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: François Charette <firmicus ατ gmx δοτ net>

pkgname=perl-cddb
pkgver=1.222
_perlmod=CDDB
pkgrel=1
pkgdesc="High-level interface to cddb/freedb protocol"
arch=('any')
url="http://search.cpan.org/~RCAPUTO/CDDB"
license=('GPL' 'PerlArtistic')
depends=('perl' 'perl-http-message' 'perl-mailtools' 'perl-libwww')
options=('!emptydirs')

source=(http://www.cpan.org/authors/id/R/RC/RCAPUTO/$_perlmod-$pkgver.tar.gz) 
md5sums=('09da67cfbc54fd40144c325e320a84ed')

build() {
  cd $_perlmod-$pkgver
  perl Makefile.PL INSTALLDIRS=vendor 
}
check(){
  cd $_perlmod-$pkgver
  make test
  }
package() {
  cd $_perlmod-$pkgver
  make
  make install DESTDIR=$pkgdir 
}
