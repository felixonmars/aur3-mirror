# Maintainer: osily <ly50247 at 126 dot com>

pkgname=ttf-ms-fonts-zh_cn
pkgver=1.2
pkgrel=1
pkgdesc='ms fonts'
arch=('any')
url='https://code.google.com/p/ly50247/downloads/list'
license=('custom:microsoft')
install=ttf-ms-fonts-zh_cn.install
source=("http://ly50247.googlecode.com/files/$pkgname.tgz")
sha1sums=('7896d3d4a81cd4e309221d910de78f2f10d1eb52')

build() {
    mkdir -p "$pkgdir/usr/share/fonts"
    mv $pkgname "$pkgdir/usr/share/fonts"
}
