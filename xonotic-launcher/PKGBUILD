# Maintainer: Spike29 <leguen.yannick@gmail.com>

pkgname='xonotic-launcher'
pkgver='0.40'
pkgrel='1'
pkgdesc='A Xonotic windowed launcher with an overview on servers, IRC pickup channel and configuration'
arch=('i686' 'x86_64')
url='http://forums.xonotic.org/showthread.php?tid=3655'
license=('GPL3')
depends=('qtwebkit')
optdepends=('xonotic')
install="$pkgname.install"
source=('http://ubuntuone.com/2eGMC04yc5oD0VAFwVeoKU'
		"$pkgname.desktop")
md5sums=('2f1f742d36fbfd2d2fbe61247dc0f4e9'
		 '38390633876371dc6f665557ece8867d')
 
build() {
	cd "$srcdir/Xonotic Launcher-0.4.0/src/"
	[ -d build ] || mkdir build && cd build
	qmake-qt4 PREFIX=/usr ..
	make
}

package() {
	install -Dm0755 "$srcdir/Xonotic Launcher-0.4.0/src/build/XonoticLauncher" \
	"$pkgdir/usr/bin/$pkgname"
	install -Dm0644 "$srcdir/$pkgname.desktop" \
	"$pkgdir/usr/share/applications/$pkgname.desktop"
}

