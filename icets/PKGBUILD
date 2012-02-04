#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=icets
pkgver=1.4
pkgrel=1
pkgdesc="Allow you to change IceWM theme"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('1d87c93f5cb27da16c90f47531b7fb21')
build() {
cd $startdir/src/$pkgname-$pkgver
qmake
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp $pkgname $startdir/pkg/usr/bin/
make DESTDIR=$startdir/pkg install
}
