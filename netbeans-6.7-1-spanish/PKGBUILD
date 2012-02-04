# Contributor: Jorge Iván Andrés Contreras Pereira <jiacontrerasp@jiacp.com>

pkgname=netbeans-6.7-1-spanish
pkgver=6.7
pkgrel=1
pkgdesc="Netbeans IDE una plataforma de desarrollo en Español"
arch=('any')
url="http://www.netbeans.org"
license=('CDDL')
depends=('java-environment')
provides=('netbeans')
conflicts=('netbeans')
source=(http://bits.netbeans.org/netbeans/6.7.1/community/fcs/bundles/netbeans-6.7.1-ml-linux.sh)
md5sums=('27d6e246baa2d3c720dd2b16f00b9927')

build() {

    cd $srcdir/
    chmod +x netbeans-6.7.1-ml-linux.sh
    sh ./netbeans-6.7.1-ml-linux.sh
}