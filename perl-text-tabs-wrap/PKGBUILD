# Maintainer : Nigel Gourlay <ngourlay@gmail.com>
pkgname=perl-text-tabs-wrap
_cpanname=Text-Tabs%%2BWrap
pkgver=2013.0523
pkgrel=1
pkgdesc="line wrapping and tab expansion"
arch=('any')
url="http://search.cpan.org/~MUIR/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/M/MU/MUIR/modules/Text-Tabs%2BWrap-2013.0523.tar.gz)
md5sums=('3e421ed3810803512af8d13bad548993')
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