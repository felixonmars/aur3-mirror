# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=rescue-max
pkgver=1.0.0.3
pkgrel=1
pkgdesc="Remake of an old Mac game called Rescue! by Tom Spreen."
arch=('i686' 'x86_64')
url="http://rescue.sourceforge.net/"
license=('GPL2')
depends=('java-runtime>=4')
install=$pkgname.install
source=(http://prdownloads.sourceforge.net/rescue/Rescue_$pkgver.zip
        $pkgname
        $pkgname.desktop
        $pkgname.install)
md5sums=('93cd94e6444d94b70196416f86f78498'
         '86888e7997abe1961540c70317caf0da'
         '3970cbf6c2ce8f5d882ba7a14163ee48'
         'b2a4488d62ca9ca4d2d286b02bcbbbeb')


package() {
  cd $srcdir/Rescue

  # Data
  install -Dm755 Rescue.jar $pkgdir/opt/$pkgname/Rescue.jar
  cp -R help/ lib/ missions/  $pkgdir/opt/$pkgname

  # Desktop icon
  install -Dm644 missions/so/sobig/thesovereign.gif  $pkgdir/usr/share/pixmaps/rescue-max.gif
  cd ..
  install -Dm644 rescue-max.desktop  $pkgdir/usr/share/applications/rescue-max.desktop
  
  # Start file
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
