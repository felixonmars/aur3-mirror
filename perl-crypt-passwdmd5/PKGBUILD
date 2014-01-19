# Contributor: Weirch Sodora <sodora at gmail dot com>
# Maintainer: Weirch Sodora <sodora at gmail dot com>

pkgname=perl-crypt-passwdmd5
pkgver=1.40
pkgrel=1
pkgdesc="Crypt::PasswdMD5 - Provides interoperable MD5-based crypt() functions"
arch=('any')
url="http://search.cpan.org/~luismunoz/Crypt-PasswdMD5/"
license=('GPL' 'PerlArtistic')
depends=('perl')
options=('!emptydirs')
source=(http://search.cpan.org/CPAN/authors/id/R/RS/RSAVAGE/Crypt-PasswdMD5-$pkgver.tgz)
md5sums=('efc61e1f62c9768be39df2613d685343')

build() {
  cd "$srcdir/Crypt-PasswdMD5-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Crypt-PasswdMD5-$pkgver"
  PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$srcdir/Crypt-PasswdMD5-$pkgver"
  make pure_install doc_install DESTDIR=$pkgdir
  find $pkgdir -name '.packlist' -delete
  find $pkgdir -name '*.pod' -delete
}
