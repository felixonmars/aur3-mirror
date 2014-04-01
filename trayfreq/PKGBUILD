# Contributor: Devin Smittle <pandagoat@gmail.com>
# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=trayfreq
pkgver=0.3
pkgrel=4
pkgdesc="Please use trayfreq-archlinux instead"
arch=('i686' 'x86_64')
url=("http://batchbin.ueuo.com/projects/trayfreq-archlinux/")
license=('GPL')
depends=('gtk2')
makedepends=()
source=(http://batchbin.ueuo.com/source/$pkgname-$pkgver.tar.gz)
md5sums=('01c592f465f40aa2b25f498291460ef7')


build() {
	make all --directory=$srcdir/$pkgname-archlinux-master
}

package() {
  make install INSTALL_PATH=$pkgdir --directory=$srcdir/$pkgname-archlinux-master
}
