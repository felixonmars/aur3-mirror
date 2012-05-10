# Contributor: Nicky726 <nicky726 <at> gmail <dot> com>
pkgname=super-postak
_origname=SuperPostak
pkgver=1.1
pkgrel=1
pkgdesc="Java for sending e-mails to multiple recepient."
arch=('any')
url="https://trac.frantovo.cz/SuperPostak/wiki"
license=('GPL3')
depends=('java-runtime')
source=(https://frantovo.cz/projekty/${_origname}/${_origname}-v${pkgver}.tar.gz
        ${pkgname}-bin)
sha256sums=('b8f3f82314461cf93690c3f138005c2d382b4c2d9961d15ebd2e77ca61cee8c6'
            '3fdbbd40b5c63ce3fc0a463045c9c2b0d7802d58db31e5ab3a9ff64609ddeddb')

package() {
	# Prepare directories 
	install -m755 -d "${pkgdir}/usr/share/java/${pkgname}"
	install -m755 -d "${pkgdir}/usr/share/${pkgname}"
	install -m755 -d "${pkgdir}/usr/bin"

	cd "${srcdir}/dist"
	# For future releases there should be some shared libs removed before copying the ohters
	# All jars to /usr/share/java/super-postak
	install -m644 *.jar \
		"${pkgdir}/usr/share/java/${pkgname}"
	install -m644 lib/*.jar \
		"${pkgdir}/usr/share/java/${pkgname}"
	# All other things to /usr/share/super-postak
	install -m644 ./*.jnlp \
		"${pkgdir}/usr/share/java/${pkgname}"
	# Copy script to /usr/bin
	install -m755 "${srcdir}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
}
