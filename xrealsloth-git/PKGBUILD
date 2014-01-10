# Maintainer: Viech <viech unvanquished net>

pkgname=xrealsloth-git
pkgver=v1.0.0.7.gd7f595f
pkgrel=1
pkgdesc="Generates XreaL/Daemon shader files from directories of texture maps"
arch=("any")
url="http://www.unvanquished.net"
license=("GPL3")
depends=("python>=3", "python-pillow")
source=("$pkgname::git+https://github.com/Unvanquished/Sloth.git")
md5sums=('SKIP')

pkgver() {
	cd $srcdir/$pkgname
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

package() {
	install -d $pkgdir/usr/bin
	install -m 755 $srcdir/$pkgname/sloth.py $pkgdir/usr/bin/${pkgname/-git/}
}
