# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=java-mod-player
pkgver=2.2
pkgrel=1
pkgdesc="Complete audio player written in JAVA supporting several different file types, playlists, audio streaming and so on.."
arch=('any')
url="http://www.javamod.de/"
license=('GPL3')
depends=('java-runtime')
source=(http://www.quippy.de/download.php?file=./modplayer/javamod.jar
        $pkgname.gif
        $pkgname
        $pkgname.desktop)
md5sums=('3ad50badae9dc5d952466b07ad2695d0'
         '741c552bc0771d1bab9d505575bd4f32'
         '3f8aa9ce78a1a7ab04e11f4bae78c6f7'
         'fdec614082c5ef7eebba6088ebf38cf6')

package() {
   cd $startdir
   
   # Binary
   install -Dm755 javamod.jar $pkgdir/usr/share/java/$pkgname/$pkgname.jar
   
   # Desktop icon
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
   install -Dm644 $pkgname.gif $pkgdir/usr/share/pixmaps/$pkgname.gif

   # Start file
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}