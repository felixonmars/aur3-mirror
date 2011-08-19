# Packager : Arnaud Durand-Favreau <biginoz _ @ _ free.fr>

pkgname=uevt
pkgver=2.3
pkgrel=1
pkgdesc="UEvt (for UPower / UDisk Event) is an energy manager and editor of independent disks and light system used office."
arch=('i686' 'x86_64')
url="http://elentir.sleipnir.fr/"
license=('GPLv3')
groups=()
depends=('upower' 'udisks' 'dbus' 'intltool' 'libnotify>=0.7' 'pm-utils' 'glib2>=2.26.0')
makedepends=('pkgconfig' 'gtk2' 'vala')
provides=()
conflicts=()
replaces=()
backup=()
source=(http://ftp.sleipnir.fr/uevt/uevt-$pkgver.tar.bz2 uevt.conf)
md5sums=('3de0963a24ae7711f87185b0ba4ef7a7'
         '3bfb4cd339620bbac82640493a64e30b')


noextract=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  ./configure prefix=/usr
  make || return 1
  
}
package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/xdg
  mkdir $pkgdir/etc/xdg/uevt
  cp ../uevt.conf $pkgdir/etc/xdg/uevt/.
}
