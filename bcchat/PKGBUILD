# Contributor: Košava <kosava@archlinux.us>
pkgname=bcchat
pkgver=2.1
pkgrel=2
pkgdesc="BCChat is chat application which can be run on any network without server."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/BCChat?content=132447"
license=('GPL2')
depends=('qt')
source=('http://qt-apps.org/CONTENT/content-files/132447-bcchat-2.1.tbz')
md5sums=('3a1042f1e3f7dd7722e56f87a56a11da')

build() {
   cd $srcdir/$pkgname-$pkgver
   cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
   make
   install -Dm755 $srcdir/$pkgname-$pkgver/bcchat $pkgdir/usr/bin/bcchat
}