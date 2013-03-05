# Maintainer: Thomas Glamsch <thomas.glamsch@gmail.com>
# Contributor: Benjarobin
# Contributor: Eric Forgeot < http://anamnese.online.fr >

pkgname=bme
pkgver=1.31
pkgrel=3
pkgdesc="The Blasphemous Multimedia Engine is a graphics/sound/input library using in turn SDL library for lowlevel support"
arch=('i686' 'x86_64')
url="http://cadaver.homeftp.net/tools.htm"
license=('BSD')
depends=('sdl')

source=('http://cadaver.homeftp.net/misc/bme.zip' 'makefile.patch')

md5sums=('d394278f789d00116cc8fbfa52d20bb9'
         'f9358e3af2aa8d5a82090f46478c693f')

build() {
	cd $srcdir/src
	patch makefile < $srcdir/makefile.patch
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/share/licenses/$pkgname

	install -m755 $srcdir/src/{bmeconv,bmeplay,dat2inc,datafile,infedit,mapedit} $pkgdir/usr/bin
	install -m644 $srcdir/src/libbme.a $pkgdir/usr/lib
	install -m755 $srcdir/src/libbme.so.0 $pkgdir/usr/lib
	install -m644 $srcdir/src/{editor,fonts}.spr $pkgdir/usr/share/$pkgname
	install -m644 $srcdir/src/{editor,fonts}.lbm $pkgdir/usr/share/$pkgname
	install -m644 $srcdir/readme.txt $pkgdir/usr/share/licenses/$pkgname
}
