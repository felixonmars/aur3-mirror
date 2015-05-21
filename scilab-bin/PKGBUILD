# Contributor: Simon Lipp <aur@simon.lipp.name>
pkgname=scilab-bin
pkgver=5.5.2
pkgrel=1
pkgdesc="Scilab is a scientific software package for numerical computations [official binary package]"
arch=(i686 x86_64)
url="http://www.scilab.org/"
provides=("scilab=$pkgver")
conflicts=('scilab')
license=('custom:CeCILL')
depends=('libxi' 'libgl' 'libxml2' 'libxtst' 'libxss')
makedepends=('patch')
options=(!strip)
source=("http://www.scilab.org/download/$pkgver/scilab-$pkgver.bin.linux-$CARCH.tar.gz"
	'fix-thirdparty-path.patch' 'scilab.desktop')
if [ "$CARCH" = "x86_64" ] ; then
	md5sums=('c24553bc2bf9871d71decd99c2d73d78'
			 '85cdefb014b6af91ff39d84bbe46e2d6'
			 'bd76d40d4caabae835ca17569a5f25d8')
else
	md5sums=('71d794854e85d484b12a8b8c954f03c4'
			 '85cdefb014b6af91ff39d84bbe46e2d6'
			 'bd76d40d4caabae835ca17569a5f25d8')
fi


prepare() {
	cd "$srcdir/scilab-$pkgver"
	patch -p1 < "$srcdir/fix-thirdparty-path.patch" || return 1
}

package() {
	install -d "$pkgdir/usr/lib" &&
	install -d "$pkgdir/usr/share/licenses/$pkgname" &&
	install -d "$pkgdir/usr/share/applications" &&
	cp -r "$srcdir/scilab-$pkgver/bin" "$pkgdir/usr" &&
	cp -r "$srcdir/scilab-$pkgver/include" "$pkgdir/usr" &&
	cp -r "$srcdir/scilab-$pkgver/share" "$pkgdir/usr" &&
	cp -r "$srcdir/scilab-$pkgver/lib/scilab" "$pkgdir/usr/lib" &&
	cp -r "$srcdir/scilab-$pkgver/lib/pkgconfig" "$pkgdir/usr/lib" &&
	cp -r "$srcdir/scilab-$pkgver/lib/thirdparty" "$pkgdir/usr/lib/scilab" &&
	cp -r "$srcdir/scilab-$pkgver/thirdparty" "$pkgdir/usr/share/scilab" &&
	install --mode=644 "$srcdir/scilab.desktop" "$pkgdir/usr/share/applications" &&
	install --mode=644 "$srcdir/scilab-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname" || return 1

	rm -f "$pkgdir/usr/include/libintl.h"
}
