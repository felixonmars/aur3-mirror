# Maintainer: Adam Pharr <anpep.cc@gmail.com>
pkgname=hdp
pkgver=0.3
pkgrel=1
pkgdesc="Minimal screenshot taking app"
arch=('any')
url="http://www.github.com/anpep/hdp"
license=('MPL')
groups=()
depends=(gtk3 curl libnotify libx11)
source=('git+https://github.com/anpep/hdp.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/usr/bin" install
}