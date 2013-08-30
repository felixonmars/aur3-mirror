# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=kactus2
pkgver=2.2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Graphical IP-XACT toolset for embedded products design'
url='http://funbase.cs.tut.fi/index.php/Kactus2'
license=('GPL')
depends=('qt5-base>=5.1.0' 'qt5-tools>=5.1.0')
install=kactus2.install
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver.tar.gz
	$pkgname-$pkgver-configure.patch
	$pkgname-$pkgver-qmake.patch)

md5sums=('b8c626a30e055af3f3c6f8dc73b2a2a7'
         '3b4cf152065fb628da281c2477492e15'
         '59ed1981bb9bd760018eaa162a73985a')

build() {
	for f in *.patch; do patch -p0 -i $f; done

	cd $pkgname-$pkgver
	./configure
	make
}

package() {
	cd $pkgname-$pkgver
	make INSTALL_ROOT="$pkgdir" install
}
