# Maintainer: Alexander Ovsyannikov <ovsinc@ya.ru>
# Contributor: Alexander Ovsyannikov <ovsinc@ya.ru>

pkgname=gimp_layer_effect
pkgver=0.1
pkgrel=1
pkgdesc="GIMP layer effect"
arch=('any')
groups=('openarch')
url="http://registry.gimp.org/node/186"
license=('GPL')
depends=('gimp')
source=('http://registry.gimp.org/files/layerfx.scm')
md5sums=('b36661a57a1abcb2e25f64987f0e8d14')

build() {
	cd "${srcdir}"
	install -d -m755 "${pkgdir}"/usr/share/gimp/2.0/scripts/
	install -m644 "${srcdir}/layerfx.scm" "${pkgdir}/usr/share/gimp/2.0/scripts/layerfx.scm"
}
