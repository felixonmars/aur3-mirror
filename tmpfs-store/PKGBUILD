# Contributor: Mark Smith <markzzzsmith@yahoo.com.au>
pkgname=tmpfs-store
pkgver=1
pkgrel=1
pkgdesc="Persistent storage of tmpfs filesystem(s) contents"
url="http://en.wikipedia.org/wiki/Tmpfs"
license="GPL"
arch=('i686' 'x86_64')
depends=('sh' 'tar')
backup=(etc/conf.d/$pkgname.conf)
install=$pkgname.install
source=($pkgname.rc.d
	$pkgname.install
	$pkgname.conf.d)
md5sums=('d08d807a981a31b4fefde8dd2c10b5b5'
	 '3ef0c3f3583910904c0ae39b00003561'
	 'af37706a78de5fffa677c1ed692b7911')

build() {

  install -D -m755 $pkgname.rc.d $startdir/pkg/etc/rc.d/$pkgname

  install -D -m644 $pkgname.conf.d $startdir/pkg/etc/conf.d/$pkgname

}
