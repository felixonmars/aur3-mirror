# Maintainer: Siôn Le Roux <sinisterstuf@gmail.com>

# Meta
pkgname=jssc
pkgver=2.8.0
pkgrel=1
pkgdesc="Java Simple Serial Connector; for working with serial ports from Java"
url="https://github.com/scream3r/java-simple-serial-connector"
depends=('java-runtime')
arch=(any)
license=(LGPL)

# Verification
md5sums=('7a4c8f90f2469338c3e83aab054e3755')
sha1sums=('14836a934de562de31412433845f64b25424ea6f')
sha256sums=('d724d35c02f57067a6087a5becb2064dfe831e98b343e5258c852e37e1b24b61')

# Files
filename="jSSC-${pkgver}-Release"
source=("${url}/releases/download/v${pkgver}/${filename}.zip")

# Actual work
package() {
    install -Dm644 ${srcdir}/${filename}/jssc.jar ${pkgdir}/usr/share/java/jssc/jssc.jar
}
