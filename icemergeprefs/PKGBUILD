#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=icemergeprefs
pkgver=0.5
pkgrel=1
pkgdesc="Allow you to merge private and global preferences files in IceWM"
url=http://icecc.sourceforge.net/
license="GPL"
arch=(i686)
depends=(icewm qt)
source=(http://dl.sourceforge.net/sourceforge/icecc/$pkgname-$pkgver.tar.bz2)
md5sums=('b34931566da118e7a14ddcb529e739c6')
build() {
cd $startdir/src/$pkgname-$pkgver
mkdir -p $startdir/pkg/usr/bin
cp $pkgname.py $startdir/pkg/usr/bin/
}
