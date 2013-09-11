# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-term-ansicolor-git
pkgver=20130909.8068020
pkgrel=1
pkgdesc="Term::ANSIColor for Perl6."
arch=('i686' 'x86_64')
url='https://github.com/tadzik/perl6-Term-ANSIColor#readme'
license=('PerlArtistic')
depends=('rakudo')
provides=('perl6-term-ansicolor')
makedepends=('git' 'perl6-ufo')
source=('term-ansicolor::git://github.com/tadzik/perl6-Term-ANSIColor.git')
md5sums=('SKIP')

pkgver() {
    cd term-ansicolor
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd term-ansicolor
    ufo
    make
}
check() {
    cd term-ansicolor
    make test
}
package() {
    cd term-ansicolor
    make DESTDIR=$pkgdir install
}
