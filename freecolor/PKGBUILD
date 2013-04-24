# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Vinzenz Vietzke <vinz@archlinux.us>
pkgname=freecolor
pkgver=0.8.8
pkgrel=3
pkgdesc="Displays free memory as a bargraph on the command line."
arch=('i686' 'x86_64')
url="http://www.rkeene.org/oss/freecolor/"
license=('GPL')
depends=('glibc')
changelog=ChangeLog
source=(http://www.rkeene.org/files/oss/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('438ffe64a6255d61628601f18bb2d990')

prepare() {
	cd $srcdir/$pkgname-$pkgver
	# fix for outdated include
	sed -i '54d' freecolor.c
}

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr --without-libstatgrab
	make 
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make prefix="$pkgdir/usr/" install
	install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
	install -m 644 README "${pkgdir}/usr/share/doc/${pkgname}"
}

