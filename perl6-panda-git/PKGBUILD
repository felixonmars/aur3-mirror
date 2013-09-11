# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-panda-git
pkgver=20130909.4547e96
pkgrel=1
pkgdesc="Rakudo Perl 6 module management solution."
arch=('i686' 'x86_64')
url='https://github.com/tadzik/panda#readme'
license=('PerlArtistic')
depends=('rakudo' 'perl6-json-tiny' 'perl6-shell-command')
provides=('perl6-panda')
makedepends=('git' 'perl6-ufo')
source=('panda::git://github.com/tadzik/panda.git')
md5sums=('SKIP')

pkgver() {
    cd panda
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
build() {
    cd panda
    ufo
    make
}
check() {
    cd panda
    make test
}
package() {
    cd panda
    make DESTDIR=$pkgdir install
    mkdir -p $pkgdir/usr/bin
    rm $pkgdir/usr/lib/parrot/*/languages/perl6/site/bin/panda.bat
    install -Dm755 $pkgdir/usr/lib/parrot/*/languages/perl6/site/bin/* $pkgdir/usr/bin/
    rm -r $pkgdir/usr/lib/parrot/*/languages/perl6/site/bin
    install -Dm644 README.md $pkgdir/usr/share/doc/panda/README.md
}

