# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-grammar-debugger-git
pkgver=20130909.96c0c46
pkgrel=1
pkgdesc="Grammar::Debugger and Grammar::Tracer Perl 6 modules."
arch=('i686' 'x86_64')
url='https://github.com/jnthn/grammar-debugger#readme'
license=('PerlArtistic')
depends=('rakudo' 'perl6-term-ansicolor')
provides=('perl6-grammar-debugger')
makedepends=('git' 'perl6-ufo')
source=('grammar-debugger::git://github.com/jnthn/grammar-debugger.git')
md5sums=('SKIP')

pkgver() {
    cd grammar-debugger
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd grammar-debugger
    ufo
    make
}
check() {
    cd grammar-debugger
    make test
}
package() {
    cd grammar-debugger
    make DESTDIR=$pkgdir install
}
