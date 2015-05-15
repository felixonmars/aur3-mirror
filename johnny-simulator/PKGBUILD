# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=johnny-simulator
pkgver=1.01
pkgrel=1
pkgdesc="Johnny - A Simulator of a Simple von-Neumann Computer"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/johnnysimulator/"
license=('GPL')
depends=('wine')
source=(http://downloads.sourceforge.net/project/johnnysimulator/johnny_v_1_01_inst_2014_04_27a.zip \
	$pkgname.sh \
	$pkgname.desktop)
md5sums=('6bc3fdd202be9cf9f1e914dee19188a1' '586336947dea8714c2f46bd2b1a8868f' '60aae171d7b417d54011d37a6c1a8f48')

package() {
	cd $srcdir/
	mkdir -p $pkgdir/opt/johnny

	cp johnny_v_1_01_inst_2014_04_27a/* $pkgdir/opt/johnny
	install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
	install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}



