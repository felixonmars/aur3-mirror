# Maintainer: Peter Kotvan <peter dot kotvan at gmail dot com>
pkgname=lumail
_gitname=lumail
pkgver=0.26
pkgrel=1
pkgdesc="Modern console-based email client developed for GNU/Linux."
arch=('i686' 'x86_64')
url="http://lumail.org/"
license=('GPLv2')
depends=('lua51' 'gmime' 'ncurses' 'pcre')
makedepends=('git' 'glibmm')
provides=('lumail')
conflicts=('lumail')
backup=('etc/lumail.lua')
source=(http://lumail.org/download/lumail-$pkgver.tar.gz)
md5sums=('6029409ccf9c571e6966d3d0a52ecf85')

build() {
    cd "$srcdir/lumail-$pkgver"
    make
}

package() {
    cd "$srcdir/lumail-$pkgver"
    install -d $pkgdir/etc
    install -d $pkgdir/usr/bin
    cp ./lumail.lua "$pkgdir/etc/lumail.lua"
    cp ./lumail $pkgdir/usr/bin/
}

