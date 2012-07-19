# Maintainer: Revolt <revolt@inbox.com>

pkgname=jewelcli
pkgver=0.8.3
pkgrel=1
pkgdesc="JewelCli uses an annotated interface definition to automatically parse and present command line arguments"
url="http://jewelcli.lexicalscope.com/"
license=('Apache License V2.0')
arch=(i686 x86_64)
source=(http://repo1.maven.org/maven2/com/lexicalscope/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.jar)
md5sums=(fc13b5b0d0a17cdd44f64bea4c8c7491)


build() {
    mkdir -p $pkgdir/usr/share/java/
    cp $srcdir/$pkgname-$pkgver.jar $pkgdir/usr/share/java/$pkgname.jar
}

