# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>

pkgname=perl6-ufo-git
pkgver=20130909.027fa5a
pkgrel=1
pkgdesc="Unobtrusive Forinsecal Organizer swoops down and creates your Perl 6 project Makefile for you."
arch=('i686' 'x86_64')
url='https://github.com/masak/ufo#readme'
license=('PerlArtistic')
depends=('rakudo')
provides=('perl6-ufo')
makedepends=('git')
source=('ufo::git://github.com/masak/ufo.git')
md5sums=('SKIP')

pkgver() {
    cd ufo
    raw_git_ver=$(git describe --always | sed 's|-|.|g')
    echo $(date +%Y%m%d).$raw_git_ver
}
package() {
    cd ufo
    install -Dm755 bin/ufo $pkgdir/usr/bin/ufo
    install -Dm644 README  $pkgdir/usr/share/doc/ufo/README
}

