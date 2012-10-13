# Maintainer: Splashy <splash at open-web dot fr>
# Contributor: Sergej Pupykin <pupykin.s+arch at gmail dot com>
# Contributor: Simon Lipp <sloonz+aur at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann at t-online dot de>
pkgname=flexdock
pkgver=1.2.0
pkgrel=1
pkgdesc="Open source graph drawing component."
arch=('any')
url="http://java.net/projects/$pkgname/"
license=('MIT')
depends=('java-runtime')
makedepends=('apache-ant' 'java-environment')
source=("http://forge.scilab.org/index.php/p/$pkgname/downloads/get/$pkgname-$pkgver-src.zip")
md5sums=('d61f4e2d5630cf31cbea749be60e7ffa')

build() {
    cd $srcdir/
    /usr/share/apache-ant/bin/ant dist
}

package() {
    cd $srcdir/
    install -Dm644 $srcdir/build/$pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
