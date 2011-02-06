# Contributor: Guillermo Garcia Ledezma <ahioros@gmail.com>

pkgname=blueclock
pkgver=0.1
pkgrel=1
pkgdesc="Clock for the GNOME panel with alarm/timer function."
license=('GPL')
arch=(i686 x86_64)
url="http://gnomefiles.org/app.php/BlueClock"
depends=('gstreamer0.10' 'gnome-panel' 'gcc')
source=(http://www.jochen-baier.d/blueclock/$pkgname-$pkgver.tar.gz)
md5sums=('56b34884db52d10422915137ef00b9b4')

build()
{
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install   || return 1
}
