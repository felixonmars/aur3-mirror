# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-json-tiny-git
pkgver=0.1.0.100.g2fe251e
pkgrel=1
pkgdesc="A tiny JSON parser and emitter for Perl 6."
arch=('i686' 'x86_64')
url='https://github.com/moritz/json#readme'
license=('PerlArtistic')
depends=('rakudo')
provides=('perl6-json-tiny')
makedepends=('git' 'perl6-ufo')
source=('json-tiny::git://github.com/moritz/json.git')
md5sums=('SKIP')

pkgver() {
    cd json-tiny
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo ${raw_git_ver#version.}
}
build() {
    cd json-tiny
    ufo
    make
}
check() {
    cd json-tiny
    make test
}
package() {
    cd json-tiny
    make DESTDIR=$pkgdir install
}

