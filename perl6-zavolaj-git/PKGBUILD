# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-zavolaj-git
pkgver=20130909.6f912ac
pkgrel=1
pkgdesc="Native call interface for Rakudo."
arch=('i686' 'x86_64')
url='https://github.com/jnthn/zavolaj#readme'
license=('PerlArtistic')
depends=('rakudo')
provides=('perl6-zavolaj')
makedepends=('git' 'perl6-ufo')
source=('zavolaj::git://github.com/jnthn/zavolaj.git')
md5sums=('SKIP')

pkgver() {
    cd zavolaj
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd zavolaj
    ufo
    make
}
check() {
    cd zavolaj
    make test
}
package() {
    cd zavolaj
    make DESTDIR=$pkgdir install
}
