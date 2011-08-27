#Maintener: palkeo <palkeo@gmail.com>
#Contributor: Laurynas "Mardukas" O. <mardukaz@gmail.com>
pkgname=ledcontrol
pkgver=0.5.2
pkgrel=1
pkgdesc="Program that allows you to show different information on the normally-unused LEDs on your keyboard"
url="http://sampo.kapsi.fi/ledcontrol/"
depends=('glib' 'gtk')
source=(http://sampo.kapsi.fi/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ba20505a21e1896552cd572cc57476c7')
license=('GPL')
arch=('i686' 'x86_64')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --mandir=/usr/share/man
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$startdir/pkg install

  # fixes
  rm -r $pkgdir/var/
}
