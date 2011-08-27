# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=cornell-bin
pkgver=1
pkgrel=1
pkgdesc="A boxy screensaver for gnome."
arch=('i686')
url="http://www.gnome-look.org/content/show.php/Cornell+Box?content=75638"
license=('ARTISTIC2')
depends=('xscreensaver')
source=('http://home.comcast.net/~gamma-ray/cornell/cornell-bin.zip')
md5sums=('02bdc35ed22d8311045fdb1f22cdcb61')

build() {
  cd "$srcdir/"

  mkdir -p $pkgdir/usr/lib/xscreensaver
  mkdir -p $pkgdir/usr/share/applications/screensavers
  mkdir -p $pkgdir/usr/share/xscreensaver/config

  cp -r $srcdir/* $pkgdir/
}

