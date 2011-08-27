#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=iceked
pkgver=1.5
pkgrel=1
pkgdesc="Allow you to edit IceWM keys file"
url=http://icecc.sourceforge.net/
license="GPL"
arch(i686)
depends=(icewm qt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('47761a8dc59880ddda2a00de9cd187f5')
build() {
cd $startdir/src/$pkgname-$pkgver
qmake
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp $pkgname $startdir/pkg/usr/bin/
make DESTDIR=$startdir/pkg install
}
