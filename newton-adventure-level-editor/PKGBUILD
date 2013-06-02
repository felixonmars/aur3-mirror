# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=newton-adventure-level-editor
pkgver=1.0
pkgrel=2
pkgdesc="Level editor for Newton Adventure"
arch=('any')
url="http://devnewton.bci.im/projects/newton_adventure/doc/trunk/www/index.wiki"
license=('BSD' 'CC-BY-SA')
depends=('java-environment')
source=(http://devnewton.bci.im/projects/newton_adventure/doc/trunk/www/downloads/newton_adventure_editor-${pkgver}.jar
        http://devnewton.bci.im/projects/newton_adventure/logo
        $pkgname
        $pkgname.desktop)
md5sums=('cf4515b242b263e821c5eec57a6eda67'
         'b5066251cffa190d46d373181ef40a7d'
         '364eba605bddbca008fd2c2a97534d3e'
         '1820a38a7e95d902dc41a109a0b4d31a')

package() {
   cd $srcdir

   install -Dm755 newton_adventure_editor-1.0.jar $pkgdir/opt/newton_adventure/newton_adventure_editor-1.0.jar

   # Desktop icon
   install -Dm644 logo $pkgdir/usr/share/pixmaps/$pkgname.png
   install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop 

   # Start file
   install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}