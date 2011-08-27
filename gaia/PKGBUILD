#Contributor: Urs Wolfer <uwolfer @ fwo.ch>

pkgname=gaia
pkgver=0.1.2
pkgrel=2
pkgdesc="Open 3D earth viewer with GPS support"
url="http://sourceforge.net/projects/gaia-clean/"
license="GPL"
arch=('i686' 'x86_64')
depends=('sdl' 'curl' 'libjpeg' 'libpng' 'mesa')
makedepends=('scons')
source=(http://dl.sourceforge.net/sourceforge/gaia-clean/$pkgname-$pkgver.tar.bz2)
md5sums=('b9bd7fd9b035e843788c6a6f25baf07f')

build() {
        cd $startdir/src/$pkgname-$pkgver
        scons prefix=$startdir/pkg/usr gpsd=0 install || return 1
}
