# Maintainer: mosra <mosra@centrum.cz>
pkgname=eclipse-visualvm
pkgver=1.0.1
pkgrel=1
pkgdesc="Eclipse launcher for VisualVM"
arch=('any')
url="http://visualvm.java.net/eclipse-launcher.html"
license=('GPL')
depends=('eclipse' 'visualvm')
makedepends=('unzip')
source=("http://java.net/downloads/visualvm/release11/visualvm-launcher.zip")
md5sums=('3f87dcced5969d99c645581070e492bf')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/eclipse"
    cp -r features plugins "$pkgdir/usr/share/eclipse"
}
