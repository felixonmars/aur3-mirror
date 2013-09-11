# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-grammar-profiler-simple-git
pkgver=20130909.cdfcdba
pkgrel=1
pkgdesc="A simple profiler that counts calls and records timing for grammar rules."
arch=('i686' 'x86_64')
url='https://github.com/perlpilot/Grammar-Profiler-Simple#readme'
license=('PerlArtistic')
depends=('rakudo')
provides=('perl6-grammar-profiler-simple')
makedepends=('git' 'perl6-ufo')
source=('grammar-profiler-simple::git://github.com/perlpilot/Grammar-Profiler-Simple.git')
md5sums=('SKIP')

pkgver() {
    cd grammar-profiler-simple
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd grammar-profiler-simple
    ufo
    make
}
check() {
    cd grammar-profiler-simple
    make test
}
package() {
    cd grammar-profiler-simple
    make DESTDIR=$pkgdir install
}
