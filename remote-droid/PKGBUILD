# Maintainer: David Mikalova <dmikalova at gmail dot com>

pkgname=remote-droid
pkgver=R3
pkgrel=2
pkgdesc="Turns your Android phone into a wireless keyboard and mouse with touchpad with R3 Patch."
arch=('any')
url="http://www.remotedroid.net"
license=('GPL')

depends=('java-runtime')
source=('remote-droid'
        'remote-droid.png'
        'remote-droid.desktop'
        'remote-droid.jar::https://dl.dropboxusercontent.com/u/432420/public/RemoreDroidR3.jar')

md5sums=('02c78eca512155cd17fa58fe8f2c9cc5'
         '0b7715afe6a9d43853bc16b6ee892fb0'
         '13380ce2237a95075de643c1cbd13268'
         '6bd289eee5d886229e8becf9246d9469')

package() {
 install -Dm 755 "$srcdir/remote-droid" "$pkgdir/usr/bin/remote-droid"
 install -Dm 644 "$srcdir/remote-droid.png" "$pkgdir/usr/share/pixmaps/remote-droid.png"
 install -Dm 644 "$srcdir/remote-droid.desktop" "$pkgdir/usr/share/applications/remote-droid.desktop"
 install -Dm 755 "$srcdir/remote-droid.jar" "$pkgdir/usr/share/java/$pkgname.jar"
}
