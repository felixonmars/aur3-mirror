# Contributor: Joel Sevilleja Febrer Joel7987[at].gmail.com

pkgname=commons-validator
pkgver=1.3.1
pkgrel=1
pkgdesc="A Java URL Validator"
arch=('i686' 'x86_64')
url="http://commons.apache.org/validator/"
license="Apache"
depends=('java-runtime' )
conflicts=('')
source=(http://www.apache.org/dist/commons/validator/binaries/${pkgname}-${pkgver}.zip)

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/usr/share/java/${pkgname}
	cp -r * ${pkgdir}/usr/share/java/${pkgname}
}


md5sums='9ca98f9f4123ca0dd49ebe5e1aeda52f'
sha256sums='cfdb467fa663f7a3207546abb801011935f3372bc6c11d0ccd600a26dce7c7a0'
