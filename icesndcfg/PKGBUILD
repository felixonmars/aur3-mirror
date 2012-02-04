#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=icesndcfg
pkgver=1.3
pkgrel=1
pkgdesc="Allow you to configure events soundsin IceWM"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('2113c524ebbbf38ce7eb174b9997c202')
build() {
cd $startdir/src/$pkgname-$pkgver
qmake
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp $pkgname $startdir/pkg/usr/bin/
make DESTDIR=$startdir/pkg install
}
