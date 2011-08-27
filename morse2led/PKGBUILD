# Contributor: Philip Nilsson <pnilsson@nullref.se>

pkgname=morse2led
pkgver=1.1
pkgrel=1
pkgdesc='display morse code on your LEDs'
license=('GPL')
depends=('libx11')
arch=('i686' 'x86_64')
url="http://damao.net/vhosts/node.to/hacks/src/$pkgname-1.0/README"
source=("http://damao.net/vhosts/node.to/hacks/src/$pkgname-$pkgver-0224.tar.gz")
md5sums=('ba95090ee9fe7e64159d0313df948f09')

build() {
	cd $startdir/src/$pkgname-$pkgver
	make -f Makefile.Linux || return 1

	for i in blinker text2morse
	do
		install -D -oroot -groot $i $startdir/pkg/usr/bin/$i || return 1
	done
}
