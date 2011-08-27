# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=symbolmachine
pkgver=1.0
pkgrel=1
pkgdesc="Simple casino game, like Fruit Machine."
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/Symbol+Machine?content=137076"
license=('GPL3')
depends=('qt')
source=(http://dacr.hu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3e5aec3db729da3f884f41451653d323')


build() {
   cd $srcdir

   qmake
   make
   install -Dm755 symbolmachine $pkgdir/usr/bin/symbolmachine

   # Desktop icon
   install -Dm644 symbolmachine.png $pkgdir/usr/share/pixmaps/symbolmachine.png
   install -Dm644 $startdir/symbolmachine.desktop $pkgdir/usr/share/applications/symbolmachine.desktop
}
