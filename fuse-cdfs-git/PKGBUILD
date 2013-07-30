pkgname=fuse-cdfs-git
pkgver=20130730
pkgrel=1
pkgdesc="cdfs fuse module"
arch=(i686 x86_64)
url="https://code.google.com/p/fuse-cdfs/"
license=('GPL')
depends=('libcdio-paranoia' 'fuse' 'sqlite''')
makedepends=('git')
source=(git+https://code.google.com/p/fuse-cdfs/)
md5sums=('SKIP')

prepare() {
	cd "$srcdir/fuse-cdfs"
	sed -i 's|cdio/paranoia.h|cdio/paranoia/paranoia.h|' cdfs-utils.c cdfs.h
}

build() {
	cd "$srcdir/fuse-cdfs"
	make
}

package() {
	cd "$srcdir/fuse-cdfs"
	install -Dm0755 fuse-cdfs $pkgdir/usr/bin/fuse-cdfs
}
