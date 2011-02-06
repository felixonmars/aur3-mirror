#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=iceiconcvt
pkgver=1.0
pkgrel=1
pkgdesc="Allow you to convert icons for IceWM"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt python pyqt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('64463287b6c535b31cb2823d97bfe299')
build() {
cd $startdir/src/$pkgname-$pkgver
mkdir -p $startdir/pkg/usr/bin
cp $pkgname.py $startdir/pkg/usr/bin/
}
