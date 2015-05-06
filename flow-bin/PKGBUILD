# Maintainer: Jakob Wadsager <jakobw@archlinux.org>

pkgname=flow-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="A static typechecker for JavaScript"
arch=('x86_64')
license=('BSD')
url="http://flowtype.org"
depends=('')
md5sums=('f226aeb504135fbfd62528cb384b7b4f')
source=("https://github.com/facebook/flow/releases/download/v${pkgver}/flow-linux64-v${pkgver}.zip")

package() {
    install -d "${pkgdir}"/usr/bin/
    mv "${srcdir}"/flow/flow "${pkgdir}"/usr/bin/
}
