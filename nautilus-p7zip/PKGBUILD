# Maintainer: Lincoln Zhang <CrazyPandar@gmail.com>

pkgname=nautilus-p7zip
pkgver=1.0.0
pkgrel=2
pkgdesc="p7zip plugin for nautilus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/nautilus-p7zip"
license=('GPL')
depends=('nautilus' 'p7zip' 'libchunfeng')
source=(http://nautilus-p7zip.googlecode.com/files/nautilus-p7zip-$pkgver.tar.gz)
md5sums=('4f2ea93a1b4a30eefc99293e405e451b')

build() {
 cd "$srcdir"/$pkgname
 ./configure CFLAGS+=-I/usr/include/chunfeng
 make || return 1
}

package() {
 cd "$srcdir"/$pkgname
 EXT_DIR="$pkgdir"/usr/lib/nautilus/extensions-3.0
 mkdir -p $EXT_DIR
 cp libnautilus-p7zip.so $EXT_DIR/
}
