# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=jripper
pkgver=1.02.1
pkgrel=1
pkgdesc="CD ripper and audio converter that can encode and decode WAV, FLAC, MP3, Ogg, and AAC(M4A) formats."
arch=('any')
url="http://www.rbri.org/jripper/jripper.html"
license=('GPL3')
depends=('java-runtime')
optdepends=('cdrkit: CD extracting tool'
            'faac: AAC audio encoder '
            'faad2: AAC audio decoder'
            'flac: for flac support'
            'lame: MP3 encoder'
            'libcddb: to access freeDB server'
            'vorbis-tools: for ogg support')
source=(http://www.rbri.org/jripper/jripper_1_02_1.jar
        jripper
        jRipper.desktop)
md5sums=('40190a11d8aad982036731fcd5f1c53f'
         'e36a054f2b7dafeb88fad2a10ae2f131'
         '8b7ca5a83ea2b51490cb6297e64a7ebb')

package() {
   cd $srcdir
   # Start file
   install -Dm755 jripper $pkgdir/usr/bin/jripper
   
   # Executable
   install -Dm755 jripper*.jar $pkgdir/usr/share/java/jRipper/jripper.jar

   # Desktop icon
   install -Dm644 com/googlepages/dronten/jripper/resource/jRipper.icon.png $pkgdir/usr/share/pixmaps/jRipper.icon.png
   install -Dm644 ../jRipper.desktop $pkgdir/usr/share/applications/jRipper.desktop
}
