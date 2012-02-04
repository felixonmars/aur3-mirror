# Contributor: gnud <ach.gnud@gmail.com>
pkgname="gimp-save-for-web"
pkgver=0.29.0
pkgrel=1
pkgdesc="Gimp-plugin for exporting web-tailored graphics"
url="http://registry.gimp.org/node/33"
makedepends=('intltool')
depends=('gimp')
source=("http://registry.gimp.org/files/${pkgname}-${pkgver}.tar.bz2")
arch=('i686' 'x86_64')
license=('GPL')

build() {
	cd "${startdir}/src/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
	make DESTDIR=${startdir}/pkg install	
}
sha1sums=('2e0a9509a651cfa1b8854a0a134a7589eec18c48')
