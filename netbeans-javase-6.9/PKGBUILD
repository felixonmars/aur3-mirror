# Contributor: Aivi_cz

pkgname=netbeans-javase-6.9
pkgver=6.9
pkgrel=ml
pkgdesc="Netbeans IDE development platform"
arch=('i686' 'x86_64')
url="http://www.netbeans.org"
license=('CDDL' 'GPL')
depends=('java-environment')
provides=('netbeans')
conflicts=('netbeans')
source=(http://download.netbeans.org/netbeans/6.9/final/bundles/netbeans-6.9-ml-javase-linux.sh)
md5sums=('7db7c2701f5a79d4b357c53dae49ee35')

build() {

    cd $srcdir/
    chmod +x netbeans-6.9-ml-javase-linux.sh
    sh ./netbeans-6.9-ml-javase-linux.sh
}
