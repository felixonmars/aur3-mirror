# Maintainer: Steven Dean <rshinesun#163.com>
_pkgname=doubanfm-player
pkgname=$_pkgname-git
pkgver=r2.850ba28
pkgrel=1
pkgdesc="A player for douban FM"
arch=('x86_64' 'i686')
url="https://github.com/rshinesun/fm-player"
license=('GPL3')
depends=('qt5-multimedia' 'gstreamer0.10-bad')
makedepends=('qt5-base' 'git')

source=('git://github.com/rshinesun/fm-player.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/fm-player"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/fm-player
	qmake
	make
}

package() {
	cd $srcdir/fm-player
	install -Dm755 Music $pkgdir/usr/bin/fm-player
}
