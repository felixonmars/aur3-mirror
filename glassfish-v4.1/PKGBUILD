# Maintainer: Vitaliy Medvedev <vray.medvedev@gmail.com>

pkgname=glassfish-v4.1
pkgver=4.1
pkgrel=1
pkgdesc="GlassFish 4.1 is a Java EE 7 open source application server."
arch=("any")
url="http://glassfish.java.net/"
license=("CDDL")
depends=('java-environment')
conflicts=("glassfish")
options=(!strip)
source=(http://dlc.sun.com.edgesuite.net/glassfish/${pkgver}/release/glassfish-${pkgver}.zip)
md5sums=('2fd41ad9af8d41d1c721c1b25191f674')

package() {
    mkdir -p $pkgdir/opt
    mv glassfish4 $pkgdir/opt/
}
