# Contributor: Dmitriy Morozov <archlinux@foxcub.org>
# Maintainer: Vojtech Horky <vojta . horky at-symbol seznam . cz>
pkgname=synopsis
pkgver=0.13
pkgrel=1 
pkgdesc="Source-code introspection tool."
url="http://synopsis.fresco.org"
arch=('i686' 'x86_64')
license=('GPL') 
depends=('python2' 'boost' 'gc' 'bison')
source=("http://synopsis.fresco.org/download/${pkgname}-${pkgver}.tar.gz" "types.patch")
md5sums=('7158458d6bfebc14bb56ab3c4c9beae7' 'f8b6d5b14ef6910e01355d0580458200')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p0 <../types.patch
	python2 setup.py config --prefix /usr/
	python2 setup.py build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --root "${pkgdir}" --prefix /usr/
}
