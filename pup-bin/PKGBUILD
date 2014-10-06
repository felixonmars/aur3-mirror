# Maintainer: qs9rx < that nick ät enjoys döt it>

pkgname=pup-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A command line tool for processing HTML."
arch=('i686' 'x86_64')
url="https://github.com/EricChiang/pup"
license=('MIT')
[ "$CARCH" = "i686"   ] && ARCH=386
[ "$CARCH" = "x86_64" ] && ARCH=amd64
source=(https://raw.githubusercontent.com/EricChiang/pup/master/LICENSE https://github.com/EricChiang/pup/releases/download/v0.3.0/pup_linux_${ARCH})
md5sums=('a98550ce25e61b1d40f1670e9857c6ff' '913b2d1afcca7e857d6653c0ad3e2c19')
[ "$CARCH" = "x86_64" ] && md5sums=('a98550ce25e61b1d40f1670e9857c6ff' '4c93ff8ee61836c7d7dbf8a50c5327f2')

package() {
	cd "$srcdir/"

	mkdir -p "$pkgdir/usr/bin"
	install -p -m755 "pup_linux_${ARCH}" "$pkgdir/usr/bin/pup"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 "LICENSE"	"$pkgdir/usr/share/licenses/$pkgname"
}