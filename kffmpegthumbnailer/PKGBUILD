# Contributor: MeMi69 <lumpilou@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=kffmpegthumbnailer
pkgver=1.1.0
pkgrel=3
pkgdesc="kffmpegthumbnailer is a video thumbnailer for KDE based on ffmpegthumbnailer"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ffmpegthumbnailer"
license=('GPL2')
depends=('kdebase-workspace' 'ffmpeg' 'ffmpegthumbnailer>=2.0.0')
makedepends=('cmake' 'automoc4')
source=(http://ffmpegthumbnailer.googlecode.com/files/$pkgname-$pkgver.tar.gz)
sha1sums=('127622e2f7bb092593795dada6b8d7c986cd22d7')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=release -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake4 ..
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/build
	make DESTDIR=${pkgdir} install
}
