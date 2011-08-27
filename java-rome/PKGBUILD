# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=java-rome
pkgver=1.0
pkgrel=2
pkgdesc="An set of open source Java tools for parsing, generating and publishing RSS and Atom feeds."
arch=('i686' 'x86_64')
url="https://rome.dev.java.net"
license=('APACHE')
depends=('java-environment' 'java-jdom')
source=(${url}/dist/rome-${pkgver}.jar setClasspath.sh)
noextract=(rome-${pkgver}.jar)
md5sums=('de11767f8b3ec4947070d9c05c733dac'
         '1f54b4758ceb4ff262a88b79c8a1ae98')
sha256sums=('ef95119f04cf7878d03988b7a89c8051acce1ccd513b7ed2913d040c1053a766'
            '8120610b478bd5f26fb75417ef854156d962fac69e866b0fc64bd7bfe1271726')

build() {
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}

	cd ${srcdir}
	install -m644 setClasspath.sh ${pkgdir}/usr/share/java/${pkgname} || return 1
	install -m644 rome-${pkgver}.jar ${pkgdir}/usr/share/java/${pkgname} || return 1
    for i in ${pkgdir}/usr/share/java/${pkgname}/*.jar; do
		_filename=${i##*\/}
		ln -s ${_filename} ${pkgdir}/usr/share/java/${pkgname}/${_filename/-${pkgver}/} || return 1
    done
}
