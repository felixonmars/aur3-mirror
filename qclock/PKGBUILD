# Contributor: Imanol Celaya <ilcra1989@gmail.com>
pkgname=qclock
pkgver=1.1
pkgrel=2
pkgdesc="it provides you time in the the same form you'd get if for example, you asked a friend, what is the time?"
arch=('i686' 'x86_64')
url="http://www.nethack.net/qclock/"
license=("unknown")
depends=(glibc)
makedepends=(gcc)
source=("http://www.nethack.net/qclock/qclock11.tar.gz")
md5sums=('1db868a5365e0793e545f74aff277b2b')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
	install -Dm755 qclock $pkgdir/usr/bin/qclock
}
