# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>
pkgname=tusdah
_pkgrev=f362238543235f03d5cd8ae5c0a1ea8b7a0ee1b1
_shortrev=f362238 # TODO: just get this from the above variable!
pkgver=0.9.1 #.${_pkgrev}
pkgrel=1
pkgdesc="The Ultimate Super Duper Aur Helper"
arch=('i686' 'x86_64')
url="https://github.com/hobarrera/tusdah"
license=('BSD')
depends=('python2' 'pyxdg')
makedepends=()

source=(https://github.com/hobarrera/${pkgname}/zipball/${_pkgrev})
md5sums=('6c9502c752e62d6e1e7bcca9b9250e6f')

build() {
	install -m 755 -D ${srcdir}/hobarrera-${pkgname}-${_shortrev}/${pkgname}.py $pkgdir/usr/bin/${pkgname}
}
