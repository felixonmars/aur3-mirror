# Contributor: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname=perl-extutils-libbuilder
_cpanname=ExtUtils-LibBuilder
pkgver=0.06
pkgrel=1
pkgdesc="A Tool to Build C Libraries"
arch=('any')
url="http://search.cpan.org/dist/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/A/AM/AMBS/${_cpanname}-${pkgver}.tar.gz) 

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  perl Build.PL installdirs=vendor destdir=$pkgdir
  perl Build
}

package() {
  cd $srcdir/${_cpanname}-${pkgver}
  perl Build install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
md5sums=('349c8ccab8ccad2a3f3bb5fba9dbd3f1')
