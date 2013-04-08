# Contributor: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: Nicky726 <nicky726 <at> gmail <dot> com>

pkgname=jing
pkgver=20091111
pkgrel=2
pkgdesc="CLI tool to validate Relax NG schemes written in Java"
arch=('i686' 'x86_64')
license=('BSD')
url=("http://www.thaiopensource.com/relaxng/jing.html")
source=("http://jing-trang.googlecode.com/files/${pkgname}-${pkgver}.zip"
	"${pkgname}"
)
depends=('java-runtime' 'iso-relax' 'saxon-he' 'xerces2-java')
md5sums=('13eef193921409a1636377d1efbf9843'
  '52872c992d1cb00d14dd620bdf0d3ee9')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/bin"

	# Prepare directories 
	install -m755 -d "${pkgdir}/usr/share/java/${pkgname}"
	install -m755 -d "${pkgdir}/usr/share/${pkgname}"
	install -m755 -d "${pkgdir}/usr/bin"

	# Main jar goes to /usr/share/java/jing
	install -m644 jing.jar "${pkgdir}/usr/share/java/${pkgname}"

	# All other things to /usr/share/jing
	cd "${srcdir}/${pkgname}-${pkgver}"
	cp -r lib "${pkgdir}/usr/share/${pkgname}/"
	cp -r doc "${pkgdir}/usr/share/${pkgname}/"
	cp -r sample "${pkgdir}/usr/share/${pkgname}/"
	install -m644 readme.html "${pkgdir}/usr/share/${pkgname}/"

	# Copy script to /usr/bin
	install -m755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
