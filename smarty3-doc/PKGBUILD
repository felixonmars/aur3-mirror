# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=smarty3-doc
pkgver=3.1.7
pkgrel=1
pkgdesc='Smarty3 documentation'
url='http://www.smarty.net'
license="LGPL"
arch=(any)
makedepends=()
conflicts=()
replaces=()
backup=()
changelog=$pkgname.changelog
source=(http://www.smarty.net/files/docs/manual-en-${pkgver}.zip)

md5sums=('829732bdabfd7bedd2c026b982c32083')

build() {
    install -d $pkgdir/usr/share/doc/smarty3
    install -m644 $srcdir/manual-en/* $pkgdir/usr/share/doc/smarty3
}

