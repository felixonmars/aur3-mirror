#Contributor: Nicolas Bigaouette <bigaouette@gmail.com>
pkgname=svg2pdf
pkgver=0.1.3
pkgrel=1
pkgdesc="Conversion of SVGs to PDFs via cairo"
url="http://cairographics.org/"
license=('custom')
depends=('libsvg-cairo')
arch=('i686' 'x86_64')
source=("http://cairographics.org/snapshots/$pkgname-$pkgver.tar.gz")
md5sums=('0059ba059ff89931cf37720fcd102d8f')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make || return 1
	make prefix=${startdir}/pkg/usr install || return 1

	mkdir -p ${startdir}/pkg/usr/share/licenses/$pkgname || return 1
	install -m 644 COPYING ${startdir}/pkg/usr/share/licenses/$pkgname/COPYING || return 1
}
