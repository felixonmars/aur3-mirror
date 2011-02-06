# Contributor: mathieui <mathieui[at]mathieui.net>
pkgname=pymg
pkgrel=1
pkgver=0.2
pkgdesc="A simple recursive image viewer"
url="http://codingteam.net/project/pymg"
arch=('any')
license=('WTFPL')
depends=('python2' 'pygtk')
source=("http://codingteam.net/project/${pkgname}/download/file/${pkgname}-$pkgver.tar.xz")
md5sums=('28ef4f6306a68ac0f0ed5c93a24ac0f7')


build() {
    cd $srcdir
    mkdir -p $pkgdir/usr/share
    mkdir -p $pkgdir/usr/bin
    cp -R ${pkgname}-$pkgver $pkgdir/usr/share/$pkgname
    echo -e '#!/bin/sh'"\npython2 /usr/share/${pkgname}/src/${pkgname}.py \$@" > $pkgdir/usr/bin/${pkgname}
    chmod +x $pkgdir/usr/bin/${pkgname}
}


