_pkgname=Riifs
pkgname=riifs
pkgver=1.02
pkgrel=1
pkgdesc="RiiFS is a simple custom network protocol used by Riivolution to allow a computer to act like a disk filesystem. This allows for both public streamable releases as well as private testing without needing to restart the game."
url="http://rvlution.net/riiv/RiiFS"
license="custom"
arch=('any')
depends=('mono')
source=("http://rvlution.net/riivolution/images/c/c2/$_pkgname-server-cs.zip" "bin")
md5sums=('93795a4b28620eb38b0d7e0fa951ffca'
         '08b83ceba46061015ce4c67934640828')

build() {
	cd $srcdir

	mkdir -p $pkgdir/usr/share/$pkgname
	cp $pkgname.exe readme.txt $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	cp bin $pkgdir/usr/bin/$pkgname
	chmod +x $pkgdir/usr/bin/$pkgname
}
