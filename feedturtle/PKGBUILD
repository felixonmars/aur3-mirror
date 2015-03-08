# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=feedturtle
pkgver=8.2
pkgrel=1
pkgdesc="Java-based multimedia manager, focused in particular on download and organization of TV shows."
arch=('any')
url="http://feedturtle.sourceforge.net/"
license=('GPL2')
depends=('java-runtime')
source=(http://sourceforge.net/projects/$pkgname/files/FeedTurtle%208.0/FeedTurtle\ $pkgver.zip
        http://c.fsdn.com/allura/p/$pkgname/icon
        $pkgname.desktop)
md5sums=('46b91c32c5040a5a4155f8640bc657c0'
         '6b723646783b14005f49a5d8368c346c'
         '28df574fd5b03c8ee586524f1f930d52')

package() {
   cd $srcdir/FeedTurtle\ $pkgver

   # Binary
   install -Dm755 FeedTurtle$pkgver.jar $pkgdir/usr/bin/feedturtle.jar

   # Desktop icon
   cd ..
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
   install -Dm644 icon $pkgdir/usr/share/pixmaps/$pkgname.png
}