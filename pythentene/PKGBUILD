# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=pythentene
pkgver=0.1a
pkgrel=3
pkgdesc="Classic arcade action for a new generation, Pythentene is Super-Python-Enhanced Serpentine 2011!"
arch=('any')
url="http://www.bitblaster.com/pythentene/"
license=('GPL3')
depends=('python2-pygame')
source=(http://rwxii.com/$pkgname/$pkgname-$pkgver.tar.gz
        $pkgname
        $pkgname.desktop)
md5sums=('383bc6c6caff2b914962dcd70dea3ac0'
         '054d6216099bd315d639d8ab60ce18b3'
         '10ca77082bac9f9f8b95b709c0bf587d')

package() {
  cd $srcdir/$pkgname-$pkgver

   # Data
   mkdir -p $pkgdir/usr/share/$pkgname
   cp -r * $pkgdir/usr/share/$pkgname

   # Desktop icon
   install -Dm644 graphics/gameIcon.png $pkgdir/usr/share/pixmaps/$pkgname.png
   cd ..
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

   # Start file
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}