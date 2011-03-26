# Contributor: Jorge Iván Andrés Contreras Pereira <jiacontrerasp@jiacp.com>

pkgname=netbeans-6.8-m1
pkgver=6.8
pkgrel=M1
pkgdesc="Netbeans IDE development platform"
arch=('any')
url="http://www.netbeans.org"
license=('CDDL')
depends=('java-environment')
provides=('netbeans')
conflicts=('netbeans')
source=(http://bits.netbeans.org/netbeans/6.8/m1/bundles/netbeans-6.8_m1-linux.sh)
md5sums=('5c06e319d27c01d50d464403b4df82c2')

build() {

    cd $srcdir/
    chmod +x netbeans-6.8_m1-linux.sh
    sh ./netbeans-6.8_m1-linux.sh
}