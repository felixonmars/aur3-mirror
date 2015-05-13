# Maintainer: Asser Schrøder Femø <asser@diku.dk>
# Contributor: Mattias Wong <0x1998@gmail.com>
# Contributor: Josh VanderLinden <arch@cloudlery.com>

pkgname=pgbadger
pkgver=7.0
pkgrel=1
pkgdesc="A fast PostgreSQL log analyzer"
arch=(any)
license=('BSD')
url="http://dalibo.github.com/pgbadger"
depends=('perl')
makedepends=('perl')
source=("http://downloads.sourceforge.net/pgbadger/${pkgver}/${pkgname}-${pkgver}.tar.gz")

md5sums=('8d674d9b57acc8e6f81eb88c6c954d9c')

build() (
    cd "${srcdir}/${pkgname}-${pkgver}"
    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    /usr/bin/perl Makefile.PL
    make
)

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
    make install INSTALLDIRS=vendor DESTDIR="${pkgdir}"
}
