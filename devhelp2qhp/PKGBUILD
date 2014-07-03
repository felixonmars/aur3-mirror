# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=devhelp2qhp
pkgver=0.3
pkgrel=1
pkgdesc="Simple utility to convert devhelp files into qhp (Qt Project Help) files which can be turned into qch (Qt Compressed Help) and used with Qt Assistant or Qt Creator."
arch=('any')
url="https://code.google.com/p/devhelp2qhp/"
license=('MIT')
depends=('python2')
changelog=ChangeLog
source=("https://devhelp2qhp.googlecode.com/files/devhelp2qhp-${pkgver}.zip")

prepare() {
    # python2 fix
    sed -i 's/env python/env python2/' devhelp2qhp
    # extract license
    sed -n '/^MIT/,/"""/p' devhelp2qhp > LICENSE
}

package() {
    # script
    install -m 755 -D devhelp2qhp "$pkgdir/usr/bin/devhelp2qhp"
    # license
    install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('dfd9bae4aba1a2a7ebb49a2c17636716e6f52eef9b0bf04eb14d9c4d73756039')
