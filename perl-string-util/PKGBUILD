# Maintainer: Filip Gralinski <filip.gralinski@poleng.pl>
pkgname=perl-string-util
_realname=String-Util
pkgver=1.21
pkgrel=3
pkgdesc="String processing utilities"
arch=('any')
license=('GPL' 'PerlArtistic')
depends=(perl)
makedepends=('make')
provides=()
conflicts=()
replaces=()
backup=()
url="http://search.cpan.org/dist/${_realname}/"
md5sums=('9878115a1af073e007a245c3fd848466')
source=(http://search.cpan.org/CPAN/authors/id/M/MI/MIKO/String-Util-1.21.tar.gz)


build() {
  cd $srcdir/${_realname}-${pkgver}

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd $srcdir/${_realname}-${pkgver}
  make install DESTDIR="$pkgdir/"
}
