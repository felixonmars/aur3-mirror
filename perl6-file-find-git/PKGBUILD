# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-file-find-git
pkgver=20130909.84e955b
pkgrel=1
pkgdesc="File::Find Perl 6 module."
arch=('i686' 'x86_64')
url='https://github.com/tadzik/File-Find#readme'
license=('PerlArtistic')
depends=('rakudo')
provides=('perl6-file-find')
makedepends=('git' 'perl6-ufo')
source=('file-find::git://github.com/tadzik/File-Find.git')
md5sums=('SKIP')

pkgver() {
    cd file-find
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd file-find
    ufo
    make
}
check() {
    cd file-find
    make test
}
package() {
    cd file-find
    make DESTDIR=$pkgdir install
}

