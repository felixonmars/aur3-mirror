# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=mixminion
_realname_=Mixminion
pkgver=0.0.8alpha3
pkgrel=1
pkgdesc="A Type III anonymous remailer"
arch=("any")
url="http://mixminion.net/"
license=("MIT")
depends=("python")
options=(!emptydirs)
source=(http://${pkgname}.net/dist/${pkgver}/${_realname_}-${pkgver}.tar.gz)

build() {
	cd "${srcdir}"/${_realname_}-${pkgver}/

	make
	make test
}

package() {
	cd "${srcdir}"/${_realname_}-${pkgver}/

	make install PREFIX="${pkgdir}"/usr
}

sha1sums=('543235e96ccde34e2db20fe79aad32412db3ccac')
