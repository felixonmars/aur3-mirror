#Contributor: BluePeppers <bluepeppers@archlinux.us>

pkgname=goldenpod
pkgver=0.8.3
pkgrel=1
url=("https://gna.org/projects/goldenpod")
arch=('i686' 'x86_64')
pkgdesc="A comandline podcast client writen in perl"
depends=('perl')
license=('GPL2')
source=("http://github.com/downloads/zerodogg/GoldenPod/$pkgname-$pkgver.tar.bz2")
md5sums=('bfc077696fc0e69957bd3d8b3395df09')

build() {
	cd $srcdir/$pkgname-$pkgver
	make prefix=$pkgdir/usr install || return 1
}

