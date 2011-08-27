# Contributor: twa022 <twa022@gmail.com>

pkgname=mpd-screenlet
pkgver=1.4.0
pkgrel=1
pkgdesc="Displays information from your MPD backend"
arch=('any')
url="http://gnome-look.org/content/show.php/MusicPlayerDaemon+(MPD+Screenlet)?content=80551"
license=('GPL')
depends=('screenlets')
source=(http://gnome-look.org/CONTENT/content-files/80551-MusicPlayerDaemonScreenlet-$pkgver.tar.gz)

build() {
  mkdir -p $pkgdir/usr/share/screenlets/
  cp -r $srcdir/MusicPlayerDaemon $pkgdir/usr/share/screenlets/
}

md5sums=('ede9a590786cd67dfdcb12b5ac8bc11c')
