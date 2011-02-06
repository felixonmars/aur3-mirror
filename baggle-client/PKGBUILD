# Contributor: mathieui <mathieui[at]mathieui.net>
pkgname=baggle-client
_pkgname=baggle
pkgrel=1
pkgver=1.1
pkgdesc="A software to play the french boggle through the network and the internet (client)"
arch=('any')
url="http://codingteam.net/projects/baggle"
license=('GPL')
depends=('openjdk6')
source=("http://codingteam.net/project/${_pkgname}/download/file/${pkgname}_${pkgver}.jar")
md5sums=('555a3a4804bc9d0d6516137019c71132')


build() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share/${_pkgname}
    mkdir -p $pkgdir/usr/bin
    cp ${pkgname}_$pkgver.jar $pkgdir/usr/share/${_pkgname}
    echo -e '#!/bin/bash'"\njava -jar /usr/share/${_pkgname}/${pkgname}_$pkgver.jar $*" > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}


