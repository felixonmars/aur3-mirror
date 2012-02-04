#Maintainer: Erus <erus.iluvatar@gmail.com>

pkgname=allblack-icons
pkgver=1
pkgrel=1
pkgdesc="A nice icon theme"
arch=('any')
url="http://mandarancio.deviantart.com/art/ALLBLACK-0-4-70641172"
license=('unknown')
depends=()
makedepends=()
source=()
md5sums=()

build() {
wget -O $pkgname.tar.gz --user-agent='Opera' http://www.deviantart.com/download/70641172/ALLBLACK_0_4_by_Mandarancio.gz
tar xf $pkgname.tar.gz
cd $srcdir/
install -d $pkgdir/usr/share/icons/
cp -R ALLBLACK $pkgdir/usr/share/icons/
chmod -R 755 $pkgdir/usr/share/icons/
}
