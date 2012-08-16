# Contributor: Tilo Brueckner  blueperil at gmx de

pkgname=perl-time-local
_realname=Time-Local
pkgver=1.2300
pkgrel=1
pkgdesc="Efficiently compute time from local and GMT time"
arch=('any')
url="http://search.cpan.org/dist/${_realname}/"
license=('PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/${_realname}-${pkgver}.tar.gz)
sha256sums=('b2acca03700a09f8ae737d3084f3f6287e983da9ab7b537c6599c291b669fb49')

build() {
    cd ${startdir}/src/${_realname}-${pkgver}
    # install module in vendor directories.
    perl Makefile.PL INSTALLDIRS=vendor || return 1
    make  || return 1
}

package() {
    cd ${startdir}/src/${_realname}-${pkgver}
    make install DESTDIR=${startdir}/pkg || return 1
}
