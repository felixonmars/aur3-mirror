# Contributor: twa022 <twa022@gmail.com>

pkgname=mythstatus-screenlet
pkgver=0.3.0
pkgrel=1
pkgdesc="MythTV Backend Info on the Desktop"
arch=('any')
url="http://gnome-look.org/content/show.php/MythStatusScreenlet?content=76511"
license=('GPL')
depends=('screenlets')
groups=('screenlets-extra')
source=(http://gnome-look.org/CONTENT/content-files/76511-MythStatus.tar.gz)

build() {
  mkdir -p $pkgdir/usr/share/screenlets
  cp -r $srcdir/MythStatus $pkgdir/usr/share/screenlets/
}

md5sums=('3c753ecdd8429fa67c50bd1b612036da')
