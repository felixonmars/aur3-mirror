# Curr maintainer: Aleksey Frolov <atommixz@gmail.com>
# Maintainer: Mihail Strashun <m.strashun@gmail.com> aka Volfram
pkgname="dmd2-complete-bin"
pkgver=2.049
pkgrel=1
pkgdesc="The Digital Mars D compiler & Standard Library (D2 version)"
arch=('i686' 'x86_64')
url="http://www.digitalmars.com/d/2.0"
source=(http://ftp.digitalmars.com/dmd.$pkgver.zip dmd.conf)
provides=('d-compiler')
license=('custom')
options=('!strip')

if [ '$CARCH' = 'i686' ]; then	depends=('libstdc++5'); else depends=('gcc-multilib'); fi

build() {
	# Dmd2
	install -Dm755 $srcdir/dmd2/linux/bin/dmd $pkgdir/usr/bin/dmd
	install -Dm755 $srcdir/dmd2/linux/bin/dumpobj $pkgdir/usr/bin/dumpobj
	install -Dm755 $srcdir/dmd2/linux/bin/obj2asm $pkgdir/usr/bin/obj2asm
	install -Dm755 $srcdir/dmd2/linux/bin/rdmd $pkgdir/usr/bin/rdmd
	install -Dm755 $srcdir/dmd2/linux/bin/shell $pkgdir/usr/bin/shell
	install -Dm644 $startdir/dmd.conf $pkgdir/etc/dmd.conf

	# Druntime
	install -Dm644 $srcdir/dmd2/linux/lib/libdruntime.a $pkgdir/usr/lib/libdruntime.a
	mkdir -p $pkgdir/usr/include/d/druntime
	cp -rf $srcdir/dmd2/src/druntime/import $pkgdir/usr/include/d/druntime

	# Lib Phobos
	install -Dm644 $srcdir/dmd2/linux/lib/libphobos2.a $pkgdir/usr/lib/libphobos2.a
	mkdir -p $pkgdir/usr/include/d
	cp -rf $srcdir/dmd2/src/phobos/{*.d,std,etc} $pkgdir/usr/include/d
	
	# Get rid of this subdirectory; it's just an unpacked zlib source
	# distribution.
	rm -rf ${pkgdir}/usr/include/d/etc/c/zlib

	# Correcting permissions
	find ${pkgdir}/usr/include/d -type d -print0 | xargs -0 chmod 755
	find ${pkgdir}/usr/include/d -type f -print0 | xargs -0 chmod 644

	# Man pages
	mkdir -p $pkgdir/usr/share/man/man{1,5}
	install -Dm644 $srcdir/dmd2/man/man1/*.1 $pkgdir/usr/share/man/man1
	install -Dm644 $srcdir/dmd2/man/man1/*.5 $pkgdir/usr/share/man/man5

	# License
	install -Dm644 $srcdir/dmd2/license.txt $pkgdir/usr/share/licenses/dmd2/LICENSE
	install -Dm644 $srcdir/dmd2/src/phobos/phoboslicense.txt $pkgdir/usr/share/licenses/libphobos2/LICENSE
}

md5sums=('9e8b18114d602360f33e8651edee7cc2'
         'aa23c01141fffca1b2a5cb214fd0b2cc')
