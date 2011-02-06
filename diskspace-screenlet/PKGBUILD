# Contributor: twa022 <twa022@gmail.com>

pkgname=diskspace-screenlet
pkgver=0.6
pkgrel=1
pkgdesc="Show free space on multiple drives"
arch=('any')
url="http://gnome-look.org/content/show.php/Disk+Space+Screenlet?content=70718"
license=('GPL')
depends=('screenlets')
source=(http://gnome-look.org/CONTENT/content-files/70718-DiskSpace.tar.gz)
md5sums=('ffa66b53b4997613f98e45cca944a18f')

build() {
  mkdir -p $pkgdir/usr/share/screenlets
  cp -r $srcdir/DiskSpace $pkgdir/usr/share/screenlets/
}
