# Contributor: Orivej Desh <smpuj@bk.ru>
pkgname=libastral
pkgver=0.5
pkgrel=1
pkgdesc="Interface library for Astral data flows"
arch=("i686" "x86_64" "x86_128")
url="http://sourceforge.net/projects/libastralso/"
license=("custom:BeerWare")
depends=()
options=("!makeflags")
source=(http://downloads.sourceforge.net/libastralso/$pkgname-$pkgver.tgz fpic.patch license)
md5sums=('1472ef0dd536da55f521807f6fcd6251' 'f2e5f1f8993f8f73e2b106e8e88cc1fd'\
         '3e8c139e9c856ed18223197321f1f45e')

build() {
	cd $srcdir/$pkgname-$pkgver
	patch -Np1 -i ../fpic.patch
	make || return 1
	install -d $pkgdir/usr/lib $pkgdir/usr/bin
	make PREFIX=$pkgdir/usr install
	install -Dm644 ../license $pkgdir/usr/share/licenses/libastral/LICENSE
}
# vim: ts=2
