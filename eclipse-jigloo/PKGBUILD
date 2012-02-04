# Maintainer: Federico Giuliani <federico.giuliani86 at gmail dot com>
# Contributor: Maciej Sitarz <macieks@freesco.pl>
# Contributor: Karol Maciaszek <karol.maciaszek@czystybeton.pl>

pkgname=eclipse-jigloo
_pkgname=jigloo
pkgver=4.6.4
_pkgver=464
pkgrel=1
pkgdesc="Jigloo - Eclipse plugin SWT/Swing GUI Builder"
url="http://www.cloudgarden.com/jigloo/"
license="custom"
arch=('i686' 'x86_64')
depends=('eclipse')
source=(http://cloudgarden1.com/jigloo_${_pkgver}.zip)
md5sums=('a2c75d84826b438c61904096889a8865')

build() {
    mkdir -p $startdir/pkg/usr/share/eclipse
    
    cd $startdir/src/

    find -type d -exec chmod 755 \{\} \;
    find -type f -exec chmod 644 \{\} \;

    cp -rf features plugins $startdir/pkg/usr/share/eclipse
}
