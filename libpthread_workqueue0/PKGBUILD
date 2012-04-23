# Maintainer: SJ_UnderWater

pkgname=libpthread_workqueue0
pkgbase=libpthread_workqueue
pkgver=0.8.2
pkgrel=0
pkgdesc='Portable implementation of the pthread_workqueue API'
url='http://mark.heily.com/project/libpthread_workqueue'
arch=('i686' 'x86_64')
license=('BSD')
depends=('glibc')
provides=('libpthread_workqueue')
options=('!libtool')
source=(BSD http://mark.heily.com/sites/mark.heily.com/files/$pkgbase-$pkgver.tar.gz)
md5sums=('d70bb9a4825e646dcf83f411224c1095'
	'20a31adf78d205a801ad5d9b19ee33a0')

build() {
	cd $pkgbase-$pkgver
	msg2 "Configuring..."
	CFLAGS="-I include -I src" ./configure --prefix=/usr
	msg2 "Making..."
	make
}
package() {
	cd $pkgbase-$pkgver
	msg2 "Building..."
	make DESTDIR="$pkgdir" install
	install -D -m644 "$srcdir"/BSD "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
