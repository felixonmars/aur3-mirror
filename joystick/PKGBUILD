pkgname=joystick
pkgver=20051019
pkgrel=12
pkgdesc="Some useful tools for using joysticks, with Debian patches (jstest, jscal, fftest)"
arch=(i686 x86_64)
url="http://packages.debian.org/squeeze/joystick"
license=('GPL')
conflicts=(joyutils)
source=(http://ftp.de.debian.org/debian/pool/main/j/joystick/${pkgname}_${pkgver}.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/j/joystick/${pkgname}_${pkgver}-${pkgrel}.debian.tar.gz)
md5sums=('47ff93fba6d94defc1b0dc3f8ff5a5ff'
         '789515412b4d8dbe05b679006e3206ec')

build() {
	cd "$srcdir/$pkgname-$pkgver.orig"
	for file in `cat $srcdir/debian/patches/series`; do
		patch -p1 < "$srcdir/debian/patches/$file"
	done

	cd utils
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver.orig"

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/man/man1

	for manfile in $srcdir/debian/*.1; do
		program=`basename $manfile | sed 's/\.1$//'`
		if [ -f utils/$program ]; then
			cp utils/$program $pkgdir/usr/bin/$program
			cp $manfile $pkgdir/usr/share/man/man1
		elif [ -f $srcdir/debian/$program ]; then
			cp $srcdir/debian/$program $pkgdir/usr/bin/$program
			cp $manfile $pkgdir/usr/share/man/man1
		fi
	done
}
