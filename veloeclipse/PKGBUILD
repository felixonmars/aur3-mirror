# Contributor: Leo von Klenze <leo@von-klenze.de>

pkgname=veloeclipse
pkgver=2.0.8
pkgrel=2
pkgdesc="A velocity and html editor for eclipse."
url="http://code.google.com/p/veloeclipse"
depends=('eclipse>=3.3')
arch=('any')
license=('GPL3')
source=("com.googlecode.veloeclipse.ui_$pkgver-feature.jar")
md5sums=('db99c135d81bda1ca2dabb0e7bd907a0')

build() {
    cd ${startdir}/src
    wget http://veloeclipse.googlecode.com/svn/trunk/update/plugins/com.googlecode.veloeclipse.ui_2.0.8.jar

    local eclipsedir=${pkgdir}/usr/share/eclipse/dropins/eclipse
    install -d $eclipsedir/features
    install -d $eclipsedir/plugins

    cp com.googlecode.veloeclipse.ui_$pkgver-feature.jar $eclipsedir/features/com.googlecode.veloeclipse.ui_$pkgver.jar
    cp com.googlecode.veloeclipse.ui_$pkgver.jar $eclipsedir/plugins/
}


