# Contributor: Andreas dot Wagner at em dot uni-frankfurt dot de

pkgname=perl-text-bibtex
_cpanname=Text-BibTeX
pkgver=0.70
pkgrel=2
pkgdesc="Parse BibTeX files"
arch=('any')
url="http://search.cpan.org/dist/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('perl')
makedepends=('perl-config-autoconf>=0.16' 'perl-extutils-libbuilder' \
    'perl-capture-tiny' )
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/A/AM/AMBS/${_cpanname}-${pkgver}.tar.gz) 
source=(http://www.cpan.org/authors/id/A/AM/AMBS/${_cpanname}-${pkgver}.tar.gz
        perl-text-bibtex.patch)

prepare() {
  cd $srcdir/${_cpanname}-${pkgver}
  patch -p0 -i "$srcdir/$pkgname.patch"
}

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  perl Build.PL installdirs=vendor destdir=$pkgdir
  perl Build
  perl Build test
}

package() {
  cd $srcdir/${_cpanname}-${pkgver}
  perl Build install
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}

md5sums=('2dfdccab7c747d1805df432f4935ce66'
         '92be523571d1a6daea9c0940b3fce008')
