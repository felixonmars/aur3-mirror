# Contributor: mathieui <mathieui[at]mathieui.net>
pkgname=climage
pkgrel=3
pkgver=0.4
pkgdesc="Climage allows you to display an image with colors in a shell."
url="http://codingteam.net/project/climage"
arch=('any')
license=('GPL')
depends=('python-imaging' 'bash')
source=("http://codingteam.net/project/${pkgname}/download/file/${pkgname}-$pkgver.tar.gz" "python.patch")
md5sums=('ecae9592106ad25ddedc3fee8a98883d'
         '42a50d66e940e1b7dd96d975b065d039')

build() {
    cd $srcdir/${pkgname}-${pkgver}/
    patch -p0 < $srcdir/python.patch
}
package() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share
    mkdir -p $pkgdir/usr/bin
    cp -R ${pkgname}-$pkgver $pkgdir/usr/share/$pkgname
    echo -e '#!/bin/bash'"\nbash /usr/share/${pkgname}/${pkgname}.sh \$*" > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
    cp $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/img
}


