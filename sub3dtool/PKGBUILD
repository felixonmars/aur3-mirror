# Maintainer: Eero Molkoselka <molkoback@gmail.com>

pkgname=sub3dtool
pkgver=0.4.2
pkgrel=1
pkgdesc="Convert subtitle files to 3D"
url="https://code.google.com/p/sub3dtool/"
arch=('any')
license=('GPL')
makedepends=('gcc')
source=("https://sub3dtool.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('049080350b484bdc93388a050f9d7512')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make all
}

package(){ 
	install -Dm 755 ${srcdir}/${pkgname}-${pkgver}/sub3dtool $pkgdir/usr/bin/sub3dtool
}
