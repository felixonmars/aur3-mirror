pkgname=iwinfo
pkgver=1
pkgrel=1
pkgdesc="Wireless information library from OpenWRT"
arch=(i686 x86_64)
url="http://openwrt.org"
license=('GPL')
depends=('lua51')
makedepends=('subversion')
source=("git://git.openwrt.org/project/iwinfo.git"
	"lua5.1.patch")
md5sums=('SKIP'
         '900ca3d57566380e08b63fce50a3be39')

prepare(){
	cd "$srcdir/$pkgname"
	patch -p1 <$srcdir/lua5.1.patch
}

build() {
	cd "$srcdir/$pkgname"
	unset LDFLAGS
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm0755 iwinfo $pkgdir/usr/bin/iwinfo
	install -Dm0755 iwinfo.so $pkgdir/usr/lib/iwinfo.so
	install -Dm0755 libiwinfo.so $pkgdir/usr/lib/libiwinfo.so
	cp -a include $pkgdir/usr/
}
