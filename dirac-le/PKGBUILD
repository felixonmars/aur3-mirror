# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=dirac-le
pkgver=3.6.2
pkgrel=1
pkgdesc="Professional time-stretching and pitch-shifting library and tools"
arch=('i686' 'x86_64')
url="http://dirac.dspdimension.com/"
[[ "$CARCH" == x86_64 ]] && {
	makedepends=('gcc-multilib')
	depends=('lib32-gcc-libs')
}
license=('custom')
source=("http://dirac.dspdimension.com/files/DIRAC3LE.zip" "license.txt")
md5sums=('6bbf22c79c58b05c1ff7e94e55421a49'
         'befece57426af018b4951cf95f002dc8')

build() {
	cd "$srcdir/--DIRAC3LE--/Dirac3-Desktop/Linux/DiracCLI"
	make
}

package() {
	cd "$srcdir/--DIRAC3LE--/Dirac3-Desktop/Linux/DiracCLI"
	install -D DiracCLI "$pkgdir/usr/bin/DiracCLI"
	case "$CARCH" in
		i686) libdir=lib;;
		x86_64) libdir=lib32;;
		*) echo "Unsupported architecture: $CARCH" >&2; exit 1;;
	esac
	install -Dm644 libDiracLE.a "$pkgdir/usr/$libdir/libDiracLE.a"
	install -Dm644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
	install -Dm644 "$srcdir/--DIRAC3LE--/DIRAC.pdf" "$pkgdir/usr/share/doc/$pkgname/DIRAC.pdf"
}
