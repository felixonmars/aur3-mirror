# Maintainer [2014-12-15] : Benjamin Auder <benjamin.a@mailoo.org>
# Last maintainer         : Jonas Heinrich <onny@project-insanity.org>

arch=('i686' 'x86_64')
pkgname=btar
pkgrel=1
pkgver=1.1.1

depends=('librsync')
md5sums=("681a77fac8dc63977d2fb7c85a149107")
options=('!buildflags')
pkgdir=/usr
license=('GPL3')
pkgdesc="btar is a tar-compatible archiver with several extra features"
source=("http://vicerveza.homeunix.net/~viric/soft/${pkgname}/${pkgname}-${pkgver}.tar.gz")
url=('http://vicerveza.homeunix.net/~viric/cgi-bin/btar')

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PREFIX="$pkgdir" install
}
