# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-shell-command-git
pkgver=20130909.2bff90e
pkgrel=1
pkgdesc="Shell::Command Perl 6 module."
arch=('i686' 'x86_64')
url='https://github.com/tadzik/Shell-Command#readme'
license=('PerlArtistic')
depends=('rakudo' 'perl6-file-find')
provides=('perl6-shell-command')
makedepends=('git' 'perl6-ufo')
source=('shell-command::git://github.com/tadzik/Shell-Command.git')
md5sums=('SKIP')

pkgver() {
    cd shell-command
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd shell-command
    ufo
    make
}
check() {
    cd shell-command
    make test
}
package() {
    cd shell-command
    make DESTDIR=$pkgdir install
}

