# PKGBUILD by KittyKatt (kittykatt@silverirc.com, http://www.kittykatt.tk)
# Maintainer: Manganelli Federico
pkgname=pdi
pkgver=2.2
pkgrel=2
pkgdesc="Pacman database Informer - pyqt GUI to perform Pacman queries quickly and easily."
arch=('i686' 'x86_64')
url="http://www.deprecated.it"
license=('GPL')
depends=('python2' 'python2-qt' 'pacman-contrib')
source=(http://www.deprecated.it/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('6236ad0c53383bf34d3f216a1fd9bdc2')

install=('pdi.install')
build() {
    cd "$srcdir/${pkgname}-${pkgver}"

    install -d $pkgdir/usr/share
    install -d $pkgdir/usr/bin
    
    chmod a+x main.py

    cd $srcdir
    cp -r "${pkgname}-${pkgver}" $pkgdir/usr/share/pdi
    cp  ${pkgname}-${pkgver}/pdi $pkgdir/usr/bin/
}
