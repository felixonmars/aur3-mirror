# Contributor: Corey Ling <kasuko at gmail dot com>

pkgname=sipie
pkgver=0.1196144357
pkgrel=4
pkgdesc="Python script for Sirius Satellite Radio"
url="http://sipie.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
depends=('python2-beautifulsoup3' 'mplayer' 'python2' 'python2-distribute')
makedepends=()
conflicts=() 
provides=()
options=(!emptydirs)
source=(http://downloads.sourceforge.net/sourceforge/sipie/Sipie-$pkgver.tar.gz sanitize.patch deprecated.patch)
md5sums=('6fcc92d0c991c5a6b795d23bbaf5ff3a'
         '7bd27bae63d2bb5c5363d8c8049bde80'
         '7b9edbf355e2e72c75254cf17ba140ef')

build() {
	cd $srcdir/Sipie-$pkgver
	patch -Np1 < ../../sanitize.patch
	patch -Np1 < ../../deprecated.patch
	python2 setup.py install --root=$pkgdir
}

