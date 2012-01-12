# Maintainer: Bjoern Lindig <bjoern dot lindig at googlemail dot com>

pkgname=sndfile-tools
pkgver=1.03
pkgrel=1
pkgdesc="A small collection of programs that use libsndfile and other libraries to do useful things"
arch=('i686' 'x86_64')
url="http://www.mega-nerd.com/libsndfile/tools/"
license=('GPL')
depends=('jack' 'cairo' 'fftw')
source=(http://www.mega-nerd.com/libsndfile/files/$pkgname-$pkgver.tar.gz)
md5sums=('5b74bb6bb4b2627158f861ae9c45e433')
build() {
	cd $srcdir/$pkgname-$pkgver
	./configure LDFLAGS="-lpthread" --prefix=/usr 
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
