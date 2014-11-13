##Author##
#Eka Tresna Irawan/Ibnu Yahya (anak10thn@gmail.com)
#PKGBUILD
#Sofyan Saputra/Iank (meongbego@gmail.com)

pkgname=ign-sdk
pkgver=1.1.6
pkgrel=041114
pkgdesc="IGN Software Development Kit"
url="https://github.com/anak10thn/ignsdk-qt"
arch=('x86_64' 'i686')
license=('BSD')
depends=('qt5-base' 'qt5-webkit')
options=('!strip' '!emptydirs')
source=('https://github.com/anak10thn/ignsdk-qt/archive/v1.1.6.tar.gz')
md5sums=('SKIP')
_gourl=github.com/anak10thn/ignsdk-qt
install='ignsdk.install'
  
build() {
	cd ignsdk-qt-1.1.6
	qmake
	make
}

package() {
  cd ignsdk-qt-1.1.6
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/ign-sdk
  mkdir -p $pkgdir/usr/share/man/man1
  
  cp -rf css $pkgdir/usr/share/ign-sdk/
  cp -rf js $pkgdir/usr/share/ign-sdk/
  cp -rf test $pkgdir/usr/share/ign-sdk/
    
  install -Dm 755 ignsdk $pkgdir/usr/bin/
  install -Dm 644 LICENSE.BSD $pkgdir/usr/share/ign-sdk/license
  
  install -Dm 644 doc/ignsdk.1.gz $pkgdir/usr/share/man/man1/
  
  rm -rf *.o

}
