# Maintainer: Andrew Ekstedt <andrew dot ekstedt at gmail dot com>
pkgname=tworld
pkgver=1.3.0
pkgrel=6
pkgdesc="Tile World, a clone of Chip's Challenge."
url="http://www.muppetlabs.com/~breadbox/software/tworld/"
arch=('i686' 'x86_64')
depends=('sdl')
license=('GPL')
source=(http://www.muppetlabs.com/~breadbox/pub/software/tworld/$pkgname-$pkgver.tar.gz
        Makefile.in.patch
        integer-types.patch
        tworld.desktop
        tworld.png)
md5sums=('03a1f5e750562b6d47b8984bb1640ec0'
         '452d867df1f8dfafc14fe392149381cd'
         '3ec0ae5fd45f3d9fd49800c22954be11'
         '74551d27a9a6dcc2fc0327857f1857ae'
         '88f3904891fda2454c297eb447c21e21')
sha1sums=('21542cb012143d563232883d9337ed0e3bd06672'
          'fe708e4e9524bf2897073b85c318b935667a5a7b'
          '2b4bd1801909229b53611334e5a320bd473ef44e'
          '1362569db66ec82eb70a3a4ea6ec7a5e204e5907'
          '5a398a2a0a3e00ceb4b85837790bf567efff0e63')

build () {
	cd "$srcdir/$pkgname-$pkgver"

        patch Makefile.in <../Makefile.in.patch
        patch -p1 <../integer-types.patch

	CFLAGS="$CFLAGS -DNDEBUG"
	autoconf
	./configure --prefix=/usr
	make
}

package () {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install

	cd "$srcdir"
	install -Dm644 tworld.desktop "$pkgdir/usr/share/applications/tworld.desktop"
	install -Dm644 tworld.png "$pkgdir/usr/share/pixmaps/tworld.png"
}
