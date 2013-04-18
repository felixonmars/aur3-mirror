# Maintainer: Laszlo Papp <djszapi2 @ gmail at com>
pkgname=lkl
pkgver=0.1.1
pkgrel=2
pkgdesc="Userspace keylogger that runs under Linux on the x86 architechture"
arch=('i686' 'x86_64')
depends=('glibc')
url="http://sourceforge.net/projects/lkl/"
license=('GPL')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('929061b66a86ff2f6ebf5a8a76cce55a15d0bc1b2ab18fb704cd6dd41508b2dd')

build() {
    cd $srcdir/$pkgname
    ./configure --prefix=/usr/
    make || return 1
}

package() {
	cd $srcdir/$pkgname
	make DESTDIR=$pkgdir install || return 1
    mkdir -p $pkgdir/usr/share/$pkgname
    mv $srcdir/$pkgname/keymaps $pkgdir/usr/share/$pkgname/keymaps
}