# Contributor: DaCoynul <jonathan.625266@earthlink.net>

pkgname=perl-config-auto
_cpanname=Config-Auto
pkgver=0.44
pkgrel=1
pkgdesc="Magical config file parser"
arch=('any')
url="http://search.cpan.org/~bingos/${_cpanname}-${pkgver}"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/B/BI/BINGOS/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('11bdd333bfb4dcf414fb78ab40a73f7f')

build() {
  cd $srcdir/${_cpanname}-${pkgver}
  sed -i '/^auto_install/d' Makefile.PL
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1 
  make || return 1
}

package() {
  cd $srcdir/${_cpanname}-${pkgver}
  make install DESTDIR=$pkgdir || return 1
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
