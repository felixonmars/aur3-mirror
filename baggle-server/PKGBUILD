# Contributor: mathieui <mathieui[at]mathieui.net>
pkgname=baggle-server
_pkgname=baggle
pkgrel=1
pkgver=1.1
pkgdesc="A software to play the french boggle through the network and the internet (server)"
arch=('any')
url="http://codingteam.net/project/baggle"
license=('GPL')
depends=('openjdk6')
source=("http://codingteam.net/project/${_pkgname}/download/file/${pkgname}_${pkgver}.jar")
md5sums=('b8ea32c47d61a878eaceb1e771a6c4e8')


build() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/${_pkgname}
    mkdir -p $pkgdir/usr/bin
    cp ${pkgname}_$pkgver.jar $pkgdir/usr/share/${_pkgname}
    echo -e '#!/bin/bash'"\njava -jar /usr/share/${_pkgname}/${pkgname}_$pkgver.jar $*" > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}


