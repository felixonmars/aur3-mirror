# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Adam Vogt <vogt.adam@gmail.com>
pkgname=similarity-tester
pkgver=2.70
pkgrel=1
pkgdesc="Detects similarity in C, Java, Pascal, Modula-2, Lisp, Miranda and natural language."
arch=('i686' 'x86_64')
url="http://dickgrune.com/Programs/${pkgname//-/_}/"
license=('BSD')
depends=('glibc')
changelog=Changelog
source=("${url}sim_${pkgver//./_}.zip")
sha256sums=('976118de65589f49bb2ec357f057551f8bfbc533794f4d28dae4567a405278a7')

prepare() {
	cd "$srcdir"
	# remove exe and zip files
	rm sim_*
	# remove msdos/windows lines
	sed -i '51,68d' Makefile
}

build() {
	cd "$srcdir"
	make -e binaries
}

package() {
	cd $srcdir

	# that makefile sucks, so we will install everything manually

	# binaries
	install -dm755 $pkgdir/usr/bin
	install -m755 sim_* $pkgdir/usr/bin

	# man page
	install -Dm644 sim.1 $pkgdir/usr/share/man/man1/sim.1

	# license
	install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# documentation
	install -dm755 "$pkgdir/usr/share/doc/$pkgname"
	install -m644 \
		Answers \
		ChangeLog \
		README \
		TechnReport \
		ToDo \
		"$pkgdir/usr/share/doc/$pkgname"
}

