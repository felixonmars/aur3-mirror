# Maintainer: Jon Eyolfson <jon@eyolfson.com>
pkgname=nodejs-connect
pkgver=2.14.1
pkgrel=1
pkgdesc="High performance middleware framework"
url="https://github.com/senchalabs/connect/"
arch=('any')
license=('MIT')
depends=('nodejs')
source=("http://registry.npmjs.org/connect/-/connect-2.14.1.tgz")
sha1sums=('e6fd676a5735ca703a89eb970f3d283fadecc2c7')
noextract=("connect-2.14.1.tgz")

package() {
    mkdir -p "${pkgdir}/usr"
    npm install "connect-2.14.1.tgz" --user root -g --prefix="${pkgdir}/usr"
}
