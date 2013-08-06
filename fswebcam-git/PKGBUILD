# Contributor: atithih <atithih@gmail.com>

pkgname=fswebcam-git
_gitname='fswebcam'
pkgver=20130530_08c49e9
pkgrel=1
pkgdesc="Neat and simple webcam app"
arch=(i686 x86_64)
url="http://www.firestorm.cx/fswebcam/"
license=('GPL')
depends=('gd')
makedepends=('git')
conflicts=('fswebcam')
provides=('fswebcam')
source=('git://github.com/fsphil/fswebcam.git')
md5sums=('SKIP')

pkgver() {
	cd $_gitname
	git log -1 --format='%cd_%h' --date=short | tr -d -
}

build() {
	cd $_gitname

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $_gitname

	make DESTDIR="$pkgdir/" install

	# create example configuration file
	mkdir -p $pkgdir/usr/share/$_gitname
	cp $srcdir/$_gitname/example.conf $pkgdir/usr/share/$_gitname/
}
