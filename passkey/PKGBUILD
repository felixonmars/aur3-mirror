# Maintainer: Baobab <eternal.baobab@gmail.com>

pkgname=passkey
pkgver=1.0.2.7
pkgrel=1
pkgdesc="Universal password generator (one password for all accounts)"
arch=('any')
url="http://sourceforge.net/projects/passkey"
license=('GPL')
depends=("java-runtime")
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-${pkgver}-bin.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.png")
md5sums=('52d699a48ba09189b9f9cbceba41581b'
         'f3c27de0413f2677ce2987751bbaba9a'
         '855942044f8b52eeb3fb48b5308c4650'
         '7fcc4285572bc8624da33134d3e31041')

build() {
    install -d $pkgdir/usr/share/java/$pkgname
    install -m644 $srcdir/$pkgname.jar $pkgdir/usr/share/java/$pkgname
    install -D -m755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m644 $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
    install -D -m644 $srcdir/readme.txt $pkgdir/usr/share/doc/$pkgname/readme.txt
}
