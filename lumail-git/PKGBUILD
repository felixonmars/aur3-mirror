# Maintainer: Peter Kotvan <peter dot kotvan at gmail dot com>
pkgname=lumail-git
_gitname=lumail
pkgver=f30bd6b
pkgrel=1
pkgdesc="Modern console-based email client developed for GNU/Linux."
arch=('i686' 'x86_64')
url="http://lumail.org/"
license=('GPLv2')
depends=('lua51' 'gmime' 'glibmm' 'ncurses' 'pcre')
makedepends=('git')
provides=('lumail')
conflicts=('lumail')
install=lumail-git.install
source=('git://github.com/skx/lumail.git')
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$_gitname"
    make
}

package() {
    cd "$_gitname"
    install -d $pkgdir/usr/bin
    install ./lumail $pkgdir/usr/bin/
    install -d $pkgdir/usr/share/lumail/
    cp ./lumail.lua $pkgdir/usr/share/lumail/
}

