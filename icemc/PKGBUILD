#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=icemc
pkgver=2.1
pkgrel=1
pkgdesc="Allow you to edit menu or toolbar file in IceWM"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('cb2afc6efaa0f9d77b0119b29d528667')
build() {
cd $startdir/src/$pkgname-$pkgver
qmake
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp icemc $startdir/pkg/usr/bin/
make DESTDIR=$startdir/pkg install
}
