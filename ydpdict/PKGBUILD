# Maintainer: jurmcc <jurmc@jurmc.mydevil.net>
# Contributor: Piotr Kujawski <piotr@lao.pl>

pkgname=ydpdict
pkgver=1.0.2
pkgrel=1
pkgdesc="Interface for Polish-English Collins Dictionary"
url="http://toxygen.net/ydpdict"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2')
groups=office
depends=('libydpdict' 'libao')
optdepends=('sox')
backup=(etc/ydpdict.conf)
source=(http://toxygen.net/ydpdict/$pkgname-$pkgver.tar.gz)
md5sums=('339be2191e94f0af5abcd037c3ef368a')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
	mkdir $pkgdir/etc
	mv $pkgdir/usr/etc/ydpdict.conf $pkgdir/etc/
	rm -R $pkgdir/usr/etc
} 
