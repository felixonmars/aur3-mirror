# Maintainer: Avi Knoll <gz.ajknoll from gmail dot com>

pkgname=zinc-compiler
pkgver=0.3.7
pkgrel=6
pkgdesc="An incremental Scala compiler and compile server"
depends=('java-environment')
source=(http://downloads.typesafe.com/zinc/$pkgver/zinc-$pkgver.tgz)
license=('Apache')
arch=('any')
url="https://github.com/typesafehub/zinc"
md5sums=('2ddd0daa832a5636be10b5132586f5f1')

package() {
    install -d ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin
    cp -r ${srcdir}/zinc-${pkgver}/* ${pkgdir}/opt/${pkgname}/
    ln -s /opt/${pkgname}/bin/zinc ${pkgdir}/usr/bin/zinc
}
