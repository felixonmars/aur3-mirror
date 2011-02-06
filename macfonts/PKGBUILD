#Maintainer: Erus <erus.iluvatar@gmail.com>
pkgname=macfonts
pkgver=1
pkgrel=1
pkgdesc="Set of Macintosh fonts"
arch=('any')
url="http://www.korben.info/des-polices-mac-sur-ubuntu.html"
license=('unknown')
depends=()
makedepends=()
source=('http://ompldr.org/vNXFlNA')
md5sums=('e185688cf54a2f2020a4bc071316b67b')

build() {
cd $srcdir/
install -d $pkgdir/usr/share/fonts/
cp -R $pkgname $pkgdir/usr/share/fonts/
chmod -R 755 $pkgdir/usr/share/fonts
}
