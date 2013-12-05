# Maintainer: Simone Sclavi 'Ito' darkhado@gmail.com
# Contributor: shacristo <shacristo at gmail dot com>

pkgname=perl-cam-pdf
_perlmod=CAM-PDF
pkgver=1.60
pkgrel=1
pkgdesc="Perl PDF manipulation library"
arch=('any')
depends=('perl-text-pdf' 'perl-crypt-rc4')
url="http://search.cpan.org/~cdolan/${_perlmod}-${pkgver}/"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
md5sums=('0eedeb8db73f8cc1c97bb28f51cb760f')
source=(http://search.cpan.org/CPAN/authors/id/C/CD/CDOLAN/${_perlmod}-${pkgver}.tar.gz)
build() {
  cd ${_perlmod}-${pkgver} 
   perl Makefile.PL INSTALLDIRS=vendor 
  make 
  }
check()
{
  cd ${_perlmod}-${pkgver} 
  make test
  }
package() {
  cd ${_perlmod}-${pkgver}
  make install DESTDIR="$pkgdir/"
}

