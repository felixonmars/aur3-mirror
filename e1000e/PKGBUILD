# Contributor: Vadym Abramchuk <abramm@gmail.com>
pkgname=e1000e
pkgver=2.1.4
pkgrel=1
pkgdesc="Intel e1000e server adapters driver"
license=(GPL)
arch=(i686 x86_64)
backup=(etc/modprobe.d/e1000e.conf)
makedepends=(linux-headers)
install="e1000e.install"
url='http://downloadcenter.intel.com/detail_desc.aspx?agr=Y&DwnldID=13663'
source=(http://downloadmirror.intel.com/15817/eng/$pkgname-$pkgver.tar.gz e1000e.install e1000e.modprobe)
md5sums=('e8dba81bfc86c6c75f39d025fb70899f'
         '6552ea893b316b10a2e7356b7d693098'
         '6092cedff7e7096b01f193024e31fd61')

build() {
	cd $srcdir/$pkgname-$pkgver/src

	make || return 1
	# Install in updates so we leave original e1000e
	install -D -m 644 e1000e.ko $pkgdir/lib/modules/`uname -r`/updates/e1000e.ko || return 1
	install -D -m 644 $srcdir/e1000e.modprobe $pkgdir/etc/modprobe.d/e1000e.conf
}
