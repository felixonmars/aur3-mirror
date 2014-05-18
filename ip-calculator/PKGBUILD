# Contributor: Trinh Anh Ngoc <20115681@student.hut.edu.vn>

ns=IPCalc
pkgname=ip-calculator
gitname=ip-calculator-mono
pkgver=1.2
pkgrel=1
pkgdesc="IP Calculator"
arch=('i686' 'x86_64')
url="https://github.com/20115681/ip-calculator-mono"
license=('GPL')
depends=('mono' 'gtk-sharp-3' 'ttf-monoone-git')
source=("$pkgname.tar.gz::https://github.com/20115681/ip-calculator-mono/archive/master.tar.gz")
md5sums=('SKIP')


build() {
	cd $srcdir/${gitname}-master

	xbuild /p:Configuration=Release $pkgname.csproj
}

package() {
    mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/share/applications
	
	cd $srcdir
	cd ../
	chmod 755 ${pkgname}
	cp $pkgname $pkgdir/usr/bin
	cp ${pkgname}.desktop $pkgdir/usr/share/applications
	
	cd $srcdir/${gitname}-master/bin/Release
	chmod 755 ${ns}.exe
	cp ${ns}.exe $pkgdir/usr/share/$pkgname
	
	cd $srcdir/${gitname}-master/icon
	cp ${pkgname}.png $pkgdir/usr/share/$pkgname
}
