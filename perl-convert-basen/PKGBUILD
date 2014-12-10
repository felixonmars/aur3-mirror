# Maintainer : Nigel Gourlay <ngourlay@gmail.com>

pkgname=perl-convert-basen
_cpanname=Convert-BaseN
pkgver=0.01
pkgrel=1
pkgdesc="encoding and decoding of base{2,4,8,16,32,64} strings"
arch=('any')
url="http://search.cpan.org/~DANKOGAI/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl-mime-base64>=0.00')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/D/DA/DANKOGAI/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('4744bcb7692d81d3bbe777f96727f4c4')
build() {
  cd $srcdir/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}
package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}