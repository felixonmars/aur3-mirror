# Maintainer: Philipp Stephan <mail@ps0ke.de>

pkgname=glsanity
pkgver=2
pkgrel=2
pkgdesc="Linux 32/64 libGL tests"
arch=('x86_64')
url="https://github.com/amonakov/glsanity"
license=('MIT')
depends=('mesa' 'lib32-mesa-libgl' 'lib32-mesa')
optdepends=('bumblebee: hybrid graphics')
source=('https://github.com/amonakov/glsanity/archive/2.zip')
sha256sums=('56291d2e8e7972ee22936c28cebc66503fea327275039d53a683ec482d9f669f')

build() {
	cd "${pkgname}-${pkgver}/src"

	CC='gcc -m32' make
	mv $pkgname-x11 $srcdir/$pkgname-x11-32
	mv $pkgname-lib $srcdir/$pkgname-lib-32
	mv $pkgname-glx $srcdir/$pkgname-glx-32

	CC='gcc -m64' make
	mv $pkgname-x11 $srcdir/$pkgname-x11-64
	mv $pkgname-lib $srcdir/$pkgname-lib-64
	mv $pkgname-glx $srcdir/$pkgname-glx-64

	cd "${srcdir}/${pkgname}-${pkgver}"

	cp LICENSE $srcdir

	cp scripts/${pkgname}-bbee $srcdir

	cp scripts/${pkgname}.in $srcdir/$pkgname
	sed -i -e 's/@CHECKERS32@/""/' $srcdir/$pkgname
	sed -i -e 's/@CHECKERS64@/""/' $srcdir/$pkgname
	sed -i -e 's/glsanity-lib/glsanity-lib-$1/' $srcdir/$pkgname
	sed -i -e 's/glsanity-x11/glsanity-x11-$1/' $srcdir/$pkgname
	sed -i -e 's/glsanity-glx/glsanity-glx-$1/' $srcdir/$pkgname
	chmod +x $srcdir/$pkgname
}

package() {
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm755 "$srcdir/${pkgname}-bbee" "$pkgdir/usr/bin/${pkgname}-bbee"
	install -Dm755 "$srcdir/$pkgname-x11-32" "$pkgdir/usr/bin/$pkgname-x11-32"
	install -Dm755 "$srcdir/$pkgname-lib-32" "$pkgdir/usr/bin/$pkgname-lib-32"
	install -Dm755 "$srcdir/$pkgname-glx-32" "$pkgdir/usr/bin/$pkgname-glx-32"
	install -Dm755 "$srcdir/$pkgname-x11-64" "$pkgdir/usr/bin/$pkgname-x11-64"
	install -Dm755 "$srcdir/$pkgname-lib-64" "$pkgdir/usr/bin/$pkgname-lib-64"
	install -Dm755 "$srcdir/$pkgname-glx-64" "$pkgdir/usr/bin/$pkgname-glx-64"
}
