##Author##
#Eka Tresna Irawan/Ibnu Yahya (anak10thn@gmail.com)
#PKGBUILD
#Sofyan Saputra/Iank (meongbego@gmail.com)

pkgname=ignsdk-dev-tools
pkgver=1.1.6
pkgrel=021114
pkgdesc="IGN Software Development Kit Developer Tools"
url="https://github.com/anak10thn/ignsdk-qt"
arch=('x86_64' 'i686')
license=('BSD')
depends=('ign-sdk')
options=('!strip' '!emptydirs')
source=('https://github.com/meongbego/ignsdk-arch-dev-tools/archive/arch-v1.1.6.tar.gz')
md5sums=('SKIP')
_gourl=github.com/anak10thn/ignsdk-qt
install='arch-dev-tools.install'

package(){
	cd ignsdk-arch-dev-tools-arch-v1.1.6
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/ign-sdk/bin/
	mkdir -p $pkgdir/usr/share/man/man1/
	mkdir -p $pkgdir/etc/
	
	install -Dm644 doc/ignsdk-app-builder.1.gz $pkgdir/usr/share/man/man1/
	install -Dm644 doc/ignsdk-app-creator.1.gz $pkgdir/usr/share/man/man1/
	install -Dm644 doc/ignsdk.1.gz $pkgdir/usr/share/man/man1/
	
	cp -rf dist $pkgdir/etc/dist/
	echo "arch" > $pkgdir/etc/ignsdk-dist
	
		
	install -Dm 755 bin/ignsdk-app-creator $pkgdir/usr/bin/
	install -Dm 755 bin/ignsdk-app-builder $pkgdir/usr/bin/
  
	install -Dm 755 bin/ignsdk-arch-builder $pkgdir/usr/share/ign-sdk/bin/
	install -Dm 755 bin/ignsdk-arch-creator $pkgdir/usr/share/ign-sdk/bin/
}
