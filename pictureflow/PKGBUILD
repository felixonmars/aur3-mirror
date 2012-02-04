# Maintainer: Piotr Maliński <riklaunim@gmail.com>
# Contributor: Piotr Maliński <riklaunim@gmail.com>

pkgname=pictureflow
pkgver=0.1.0
pkgrel=2
pkgdesc="PictureFlow is a Qt2/Qt3/Qt4/Qtopia4 widget to display images with animated transition effect, much like Apple's Cover Flow"
url="http://qt-apps.org/content/show.php/PictureFlow?content=75348"
depends=('qt')
makedepends=('qt')
arch=('x86_64 i686')
source=("http://pictureflow.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('9f95d989e30d75a29ba1ddbad16cafbf')
license=('GPL')

build() {
	cd $startdir/src/$pkgname-$pkgver/pictureflow-qt
	qmake
	make || return 1
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/include/pictureflow
	cp pictureflow $startdir/pkg/usr/bin/
	cp pictureflow.h $startdir/pkg/usr/include/pictureflow/pictureflow.h
}
