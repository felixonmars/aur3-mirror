# Maintainer: Mike Stunes <kc0tqx at gmail dot com>

pkgname=electric
pkgver=9.04
pkgrel=2
pkgdesc="A sophisticated electrical CAD system"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/electric/"
license=('GPL3')
depends=('java-runtime')
source=(http://ftp.gnu.org/pub/gnu/electric/$pkgname-$pkgver.jar \
        electric )

md5sums=('9437d31bfc68f4a39a6180a2a40f347e'
         '2ee496cb252374cd7595f19173a1bda7')

build() {
    # Move jarfile into /usr/share/java/electric
    install -Dm644 $srcdir/$pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar

    # Move starter shell script into /usr/bin
    install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
}
