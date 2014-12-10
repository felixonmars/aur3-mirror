# Maintainer : Nigel Gourlay <ngourlay@gmail.com>
pkgname=perl-text-bidi
_cpanname=Text-Bidi
pkgver=2.09
pkgrel=1
pkgdesc="Unicode bidi algorithm using libfribidi"
arch=('any')
url="http://search.cpan.org/~KAMENSKY/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=()
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/K/KA/KAMENSKY/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('39a4754c1c3eb4d8f942f17ac6b6338f')
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
