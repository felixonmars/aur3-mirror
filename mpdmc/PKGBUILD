# Contributor: Uli <uli_armbruster@web.de>
#	       Will <will.foran@gmail.com>

pkgname=mpdmc
pkgver=0.3
pkgrel=1
pkgdesc="a series of simple, easy-to-remember, and fast-typed syntax scripts for mpd. includes some last.fm integration"
arch=(i686)
url="http://bash.madskas.net/#mc"
license=('GPL')
depends=(bash mpc)
source=(http://bash.madskas.net/files/mc.zip)
build() {

mkdir -p $pkgdir/usr/bin/
cd "$srcdir"
install -m 0755 mcc $pkgdir/usr/bin/mcc
install -m 0755 mcp $pkgdir/usr/bin/mcp
install -m 0755 mcf $pkgdir/usr/bin/mcf
}

md5sums=('72d717dfda2d78d04e32e28a71446f26')
