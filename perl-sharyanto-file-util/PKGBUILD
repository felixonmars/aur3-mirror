# Maintainer: 3ED <krzysztof1987 at gmail dot com>
#
pkgname=perl-sharyanto-file-util
_lastauthor=P/PE/PERLANCAR
_pkgname=SHARYANTO-File-Util
pkgver=0.58
pkgrel=1
pkgdesc='File-related utilities'
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-file-chdir' 'perl-file-slurp-tiny')
checkdepends=('perl-file-chdir' 'perl-file-slurp-tiny')
url="https://metacpan.org/release/${_pkgname}"
source=(https://cpan.metacpan.org/authors/id/${_lastauthor}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('a6e83e1658bbaaa56462d4f1fb46dae01a5c12790aabb03c2e43f1443ce8c2d97523ec15cea1e31e2a90be58917e7f20815d927f7d4bc8147af505e4ada585e2')

build() {
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null

  cd "${srcdir}/${_pkgname}-${pkgver}"
  perl Makefile.PL
  make
}
check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make test
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make install
}
