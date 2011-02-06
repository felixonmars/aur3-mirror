#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=hybrid-share-core
_realpkgname=hybrid-share
pkgver=1.2.0
pkgrel=1
pkgdesc="Core required by Hybrid-Share"
url=http://hybrid-share.sourceforge.net
license="GPL"
arch=(i686)
depends=(mono gtk-sharp-2 glade niry-sharp)
source=(http://dl.sourceforge.net/sourceforge/$_realpkgname/$_realpkgname-$pkgver-src.tar.bz2)
md5sums=('e786d3fb2897e349aa0139e38e6088e9')


build() {
cd $startdir/src/$pkgname/
sh ./autogen.sh
./configure --prefix=/usr
make || return 1
make DESTDIR=$startdir/pkg/ install
}
