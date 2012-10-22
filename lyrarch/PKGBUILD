# Maintainer: lantuin < lantuin at gmail dot com >

pkgname=lyrarch
pkgver=0.12
pkgrel=1
pkgdesc="A bash search tool for song lyrics"
arch=('any')
url="http://sourceforge.net/projects/lyrarch/"
license=('GPL')
optdepends=('aurvote')
source=("http://sourceforge.net/projects/lyrarch/files/$pkgname-$pkgver.tar.gz")
md5sums=('f63ed8634cd66277bb0ebc6b0466de1a')

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=${pkgdir} install
}
