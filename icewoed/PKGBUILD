#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=icewoed
pkgver=1.8
pkgrel=1
pkgdesc="A windows options editr for IceWM"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('518f05c02cb24a7e36715ce0d0672c8e')
build() {
cd $startdir/src/$pkgname-$pkgver
qmake
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp $pkgname $startdir/pkg/usr/bin/
make DESTDIR=$startdir/pkg install
}
