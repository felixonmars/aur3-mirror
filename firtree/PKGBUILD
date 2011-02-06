# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=firtree
pkgver=0.2.1
pkgrel=1
pkgdesc="Firtree is an on-demand, non-destructive, GPU accelerated image-processing system."
arch=('i686' 'x86_64')
url="http://firtree.org/"
license=('GPL')
depends=('python-clutter' 'pycairo' 'styx' 'llvm-gcc')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('02b06628af2e35b2cd192228e4f526d8')

build() {

	cd $startdir/src/${pkgname}-${pkgver} || return 1
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

}
