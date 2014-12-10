# Maintainer : Nigel Gourlay <ngourlay@gmail.com>

pkgname=perl-crypt-gcrypt
_cpanname=Crypt-GCrypt
pkgver=1.26
pkgrel=1
pkgdesc="Perl interface to the GNU Cryptographic library"
arch=('any')
url="http://search.cpan.org/~AAR/${_cpanname}"
license=('GPL' 'PerlArtistic')
depends=('libgcrypt>=0.00')
options=('!emptydirs')
source=(http://www.cpan.org/authors/id/A/AA/AAR/${_cpanname}-${pkgver}.tar.gz) 
md5sums=('d23084ed878e5d12d4956c39e6f2b813')
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
