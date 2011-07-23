# Maintainer: Lincoln Zhang <CrazyPandar@gmail.com>

pkgname=libchunfeng
pkgver=0.1.0
pkgrel=2
pkgdesc="a simple personal use library like glib"
arch=('i686' 'x86_64')
url="http://code.google.com/p/libchunfeng"
license=('LGPL')
#groups=('base-devel')
depends=('glibc' "util-linux")
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('d1e31519890f0a8e49a5ede3c41d3b9a')

build() {
 cd $srcdir/$pkgname
 ./configure ENABLE_BLKID=yes
 make || return 1
}

package() {
 cd "$srcdir"/$pkgname
 LIB_DIR="$pkgdir"/usr/lib/
 INC_DIR="$pkgdir"/usr/include
 mkdir -p $LIB_DIR
 mkdir -p $INC_DIR
 cp -a include/ $INC_DIR/chunfeng
 cp -a libchunfeng.so libchunfeng.so.$pkgver $LIB_DIR/
}
