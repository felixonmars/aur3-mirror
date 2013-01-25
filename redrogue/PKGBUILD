# Maintainer: qs9rx < that nick at enjoys döt it>

pkgname=redrogue
pkgver=1.0.3
pkgrel=1
pkgdesc="A side-scrolling roguelike-like. Descend into the Dungeon of Chaos, retrieve the Amulet of Yendor, kill all who stand in your way and return with your prize."
arch=("i686")
url="http://www.redrogue.net"
license=(GPL)
depends=("gtk2")

sha256sums=('9c75b2da3df2ad69e4a2c38976a46f77eb08eb818115ed60c177aab8929161c5')

source=("https://s3.amazonaws.com/redrogue/redrogue")

build() {
	install -d "$pkgdir/usr/bin"
	install -m755 redrogue $pkgdir/usr/bin
}