# Author: Jan Waś <janek.jan@gmail.com>

_pkgname=hhvm-pgsql
pkgname=$_pkgname-git
pkgver=3.6.0
pkgrel=1
pkgdesc="PostgreSQL extension for HHVM"
arch=('i686' 'x86_64')
url="https://github.com/PocketRent/$_pkgname"
license=(PHP)
depends=('hhvm' 'postgresql-libs')
makedepends=('git' 'cmake')
md5sums=('SKIP')
source=("$_pkgname::git+https://github.com/PocketRent/$_pkgname.git#tag=3.6.0")

prepare() {
    mkdir -p "${srcdir}/build"
    mkdir -p "${srcdir}/hphp/runtime"
    cp "${srcdir}/${_pkgname}/ext_pgsql.php" "${srcdir}/build/"
    cd "${srcdir}/${_pkgname}"
    hphpize
    cd ../build
    cmake "../${_pkgname}"
}

build() {
    cd "${srcdir}/build"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}" install
    #mv "$pkgdir"/usr/lib{64,}
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.PHP" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.PHP"
}

# vim:set ts=2 sw=2 et:
