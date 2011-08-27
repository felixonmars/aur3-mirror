#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=icecursorscfg
pkgver=0.6
pkgrel=1
pkgdesc="Allow you to change cursors in IceWM"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt python pyqt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('000ec299a03dbae269f2f335910bd50e')
build() {
cd $startdir/src/$pkgname-$pkgver
mkdir -p $startdir/pkg/usr/bin
cp icecurcfg.py $startdir/pkg/usr/bin/
}
