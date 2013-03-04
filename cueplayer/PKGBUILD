 
# Contributor: said <atvordhosbn at gmail dot com> 

pkgname=cueplayer
pkgver=0.28
pkgrel=2
pkgdesc="A Qt audio player with cue support"
arch=('i686' 'x86_64')
url="http://cueplayer.googlecode.com"
license=('GPL')
depends=('qt4')
source=(http://cueplayer.googlecode.com/files/$pkgname-$pkgver.tar.gz $pkgname.desktop)
md5sums=('7ea51fe9fb88030eb52b26674a9d9180'
         '12ead5eeff8317fa272b77ec8cfac602')


build() {
  cd  $srcdir/$pkgname-$pkgver
  lrelease cueplayer.pro
  qmake
  make
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname || return 1
  install -Dm644 images/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $startdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
