# Contributor: Max Nemeth <max.nemeth@gmail.com>
pkgname=pacpl-d3lphin
pkgver=4.0.1
pkgrel=2
pkgdesc="Convert multiple audio types from one format to another. D3lphin integration."
arch=('i686')
url="http://viiron.googlepages.com/"
license=('GPL')
depends=('d3lphin' 'pacpl')
source=(http://downloads.sourceforge.net/pacpl/pacpl-$pkgver.tar.gz)
md5sums=('a4cdfda5c7c064ae03ca57ed214289d4')

build() {
	cd $startdir/src/pacpl-$pkgver
	./configure
	make || return 1
	install -Dm755 plugins/dolphin/pacpl.desktop $startdir/pkg/opt/kde/share/apps/d3lphin/servicemenus/pacpl.desktop
}
