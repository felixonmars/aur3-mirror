# Maintainer: Qi Wenmin <qiwenmin(at)gmail(dot)com>, Mat <matlinuxer2@gmail.com>
pkgname=ucimf-openvanilla
pkgver=2.10.11
pkgrel=2
pkgdesc="Bridge between ucimf suites and openvanilla input modules."
arch=("i686" "x86_64")
license=('GPL')
url="http://code.google.com/p/ucimf/"
depends=('freetype2' 'libucimf>=2.3.7' 'openvanilla-modules>=0.8.0_9')
source=("http://ucimf.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('8e095b9420c51c5a3855660b20a165d0')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
}
