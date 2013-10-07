# Maintainer: Sebastian Neef <aur @ gehaxelt DOT in>

pkgname=ritx
pkgver=1.6
epoch=1
pkgrel=1
pkgdesc="Reverse Ip Lookup Tool"
arch=('any')
url="https://code.google.com/p/ritx/"
license=('GPL2')
makedepends=('wget' 'unzip')
depends=('perl')
url="https://ritx.googlecode.com/files/RitX-Reverse-Ip-Tool-v1.6.zip"

build() {
    _srcURL="https://ritx.googlecode.com/files/RitX-Reverse-Ip-Tool-v1.6.zip"
    rm -rf $srcdir/$pkgname-$pkgver
    mkdir $srcdir/$pkgname-$pkgver
    wget $_srcURL -O $srcdir/$pkgname-$pkgver/ritx.zip
    cd $srcdir/$pkgname-$pkgver/
    unzip -o ritx.zip
    
}

package() {
    cd $srcdir/$pkgname-$pkgver/ritx/
    install -Dm755 RitX.pl "$pkgdir/usr/bin/ritx"
    install -Dm644 README "$pkgdir/usr/share/doc/ritx"
}
