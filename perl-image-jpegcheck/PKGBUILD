# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>
pkgname=perl-image-jpegcheck
_perlmod=Image-JpegCheck
pkgver=0.10
pkgrel=1
pkgdesc="jpeg file checker for perl"
arch=('any')
depends=('perl')
url="http://search.cpan.org/~tokuhirom/Image-JpegCheck-0.10/lib/Image/JpegCheck.pm"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/T/TO/TOKUHIROM/${_perlmod}-${pkgver}.tar.gz)
md5sums=('9d5f035008c8f01772bc4c5fd8b393e0')
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

