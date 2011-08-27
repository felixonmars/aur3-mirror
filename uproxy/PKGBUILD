# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>

pkgname=uproxy
pkgver=0.91
pkgrel=1
pkgdesc='UProxy a proxy for UDP protocols.'
url="http://www.geocities.com/SiliconValley/Vista/8155/$pkgname/"
license="GPL"
source=("http://www.geocities.com/SiliconValley/Vista/8155/$pkgname/$pkgname.zip")
md5sums=('9a484a9d328bf8baf79cfdbc99ccb285')
arch=('i686')

build() {
	gcc uproxy.c -o uproxy
	install -D -m755 uproxy $startdir/pkg/usr/bin/uproxy
}
