# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qothello
pkgver=0.2
pkgrel=2
pkgdesc="Simple Othello(Reversi) game."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/QOthello?content=146401"
license=('GPL3')
depends=('qt4')
install=$pkgname.install
source=(http://qt-apps.org/CONTENT/content-files/146401-Othello.tar.gz
        $pkgname.desktop)
md5sums=('9e21767ad0a7cc2b4094fbb4f1d25d9b'
         '7cc329af2dc17d1a688c82182b0e6d20')

prepare() {
   cd $srcdir/Othello-2
   qmake-qt4        
}

build() {
   cd $srcdir/Othello-2
   make
}

package() {
   cd $srcdir/Othello-2
   install -Dm755 QOthello $pkgdir/usr/bin/qothello

   # Desktop icon
   install -Dm644 Othello-risorse/resurces/logo.png $pkgdir/usr/share/pixmaps/$pkgname.png
   install -Dm644 ../$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

   # Risorse directory(Copy to your home folder!)
   cp -r Othello-risorse $pkgdir/usr/share
}