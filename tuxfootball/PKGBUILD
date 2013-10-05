# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=tuxfootball
pkgver=0.3.1
pkgrel=2
pkgdesc="Arcade-style 2D football game very reminiscent of Sensible Soccer and Kick Off."
arch=('i686' 'x86_64')
url="http://tuxfootball.sourceforge.net/"
license=('GPL2')
depends=('hicolor-icon-theme' 'sdl_image' 'sdl_mixer')
conflicts=('tuxfootball-git')
source=(http://prdownloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('80359c616368e7b424624887dcbfd9a1')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
}
  
build() {
  cd $srcdir/$pkgname-$pkgver
  make
}
  
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  
  # Full screen mode(-w for windowed mode)
  sed -i "s|Exec=tuxfootball|Exec=tuxfootball -f|" $pkgdir/usr/share/applications/tuxfootball.desktop
}