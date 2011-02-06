#Contributor: Fabio 'Black_Codec' <blackxar@email.it>
pkgname=hybrid-share
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple user friendly application that allow Mac,Windows and Linux users to share files"
url=http://hybrid-share.sourceforge.net
license="GPL"
arch=(i686)
depends=(mono gtk-sharp-2 glade niry-sharp hybrid-share-core hybrid-share-plugins)
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver-src.tar.bz2)
md5sums=('e786d3fb2897e349aa0139e38e6088e9')


build() {
cd $startdir/src/$pkgname/
sh ./autogen.sh
./configure --prefix=/usr
make || return 1
make DESTDIR=$startdir/pkg/ install
}
