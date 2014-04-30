#Maintainer: lordwelch

pkgname=mac-icons-v3-noobslab
pkgver=3.1
pkgrel=1
pkgdesc="MAC OS Icons/Cursors by NoobsLab"
arch=('any')
url="https://launchpad.net/~noobslab/+archive/themes/"
license=('unknown')
source=('https://launchpad.net/~noobslab/+archive/themes/+files/mac-icons-v3_3.10%7Etrusty%7ENoobsLab.com.tar.gz')
md5sums=('805e093fbdf72d5b52a76118d524efa7')

package() {
        cd "$srcdir/MBuntu-icons"
        mkdir -p "$pkgdir/usr/share/icons"
        cp -r MB* "$pkgdir/usr/share/icons"
        cp -r mac-cursors "$pkgdir/usr/share/icons/"
        chmod 755 -R "$pkgdir/usr/share/icons/"
}