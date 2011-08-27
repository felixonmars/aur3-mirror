# Maintainer: Stanislav GE <ginermail@gmail.com>

pkgname=lanshark
pkgver=0.0.2
pkgrel=2
pkgdesc="A P2P Filesharing tool for local area networks"
arch=(i686 x86_64)
url=http://lanshark.29a.ch
license=(GPL3)
depends=('python2>=2.5' 'pygtk>=2.10' python-simplejson)
source=(http://lanshark.29a.ch/downloads/$pkgname-$pkgver.tar.bz2)
md5sums=(2d8b60e3b68ca8e84de9a4246d4fd573)

build() {
	cd $srcdir/Lanshark-$pkgver || return 1
	# remove simplejson from the source
	rm -r src/$pkgname/simplejson	
	# build and install
	python2 setup.py build || return 1
	python2 setup.py install --root $pkgdir || return 1
}
