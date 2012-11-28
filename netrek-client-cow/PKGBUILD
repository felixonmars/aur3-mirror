# Maintainer: Gitus <pelomb at gmail dot com>

pkgname=netrek-client-cow
pkgver=3.3.0
pkgrel=1
pkgdesc="A multi-player battle simulation with a Star Trek theme."
arch=('i686' 'x86_64')
url="http://www.netrek.org/"
license=('GPL')
depends=('sdl_mixer' 'libxpm' 'imlib2' 'libxxf86vm' 'gmp')
source=("https://launchpad.net/netrek-client-cow/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('0ff5366d35a8bce1d4139aa29bead7cc')

build() {
	cd $srcdir/$pkgname-$pkgver

# Patch gmp version check
		sed -i 's_gmp=.*2_gmp=.*[02-9]_' configure    

# Build
		./configure --prefix=/usr
		make
		make DESTDIR=$pkgdir install

# Docs
		mkdir -p $pkgdir/usr/local/share/games/netrek-client-cow/Docs
		install -Dm644 COW.DOC cow.html $pkgdir/usr/local/share/games/netrek-client-cow/Docs

# Executable in path
		install -d $pkgdir/usr/bin
		cat << EOF >> $pkgdir/usr/bin/netrek-client-cow

#!/bin/bash
/usr/local/games/netrek-client-cow
EOF

		chmod +x $pkgdir/usr/bin/netrek-client-cow
}
