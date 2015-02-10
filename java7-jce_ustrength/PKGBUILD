# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: kevku <kevku@gmx.com>
# Contributor: Cedric Sougne <cedric@sougne.name>
# Contributor: Tom < reztho at archlinux dot us >
pkgname=java7-jce_ustrength
pkgver=7
pkgrel=1
pkgdesc="Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files 7"
arch=('any')
url='http://www.oracle.com/technetwork/java/javase/downloads/jce-7-download-432124.html'
license=('custom')
install=${pkgname}.install
depends=('java-runtime>=7')
conflicts=('java-jce_ustrength')
source=('http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip' 'install_java7_jce_ustrength')
DLAGENTS=('http::/usr/bin/curl -LC - -b oraclelicense=a -O')
sha256sums=('7a8d790e7bd9c2f82a83baddfae765797a4a56ea603c9150c87b7cdb7800194d'
            '18e7724fc1ce4f0b4e44956e6846dcee25b253e7a022b2d66013762753f1eba1')

package() {
	cd "$srcdir/UnlimitedJCEPolicy"
	# Fixed place for the jce_policy files
	install -Dm644 US_export_policy.jar "${pkgdir}/usr/share/java/${pkgname}/US_export_policy.jar"
	install -Dm644 local_policy.jar "${pkgdir}/usr/share/java/${pkgname}/local_policy.jar"
	
	# Installing the script
	install -Dm755 "${srcdir}/install_java7_jce_ustrength" "${pkgdir}/usr/bin/install_java7_jce_ustrength"

	# The documentation
	install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}
