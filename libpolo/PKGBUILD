# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=libpolo
pkgver=0.97
pkgrel=1
pkgdesc="A lightweight graphics, sound and network library for educational environments"
arch=('i686' 'x86_64')
url='https://code.google.com/p/libpolo/'
license=('GPL')
depends=('glut' 'portaudio' 'libsndfile')
source=("https://libpolo.googlecode.com/files/${pkgname}-${pkgver}.zip")
md5sums=('e93b48f8dd634e99941c830772f2dd57')


build() {
	cd $srcdir/${pkgname}-${pkgver}
     ./configure  --prefix=/usr 
	make
}

package() {
	cd $srcdir/${pkgname}-${pkgver}
	make DESTDIR=$pkgdir install
}

