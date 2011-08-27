# Contributor: twa022 <twa022@gmail.com>

pkgname=infopanel-screenlet
pkgver=0.10.1
pkgrel=1
pkgdesc="All sorts of system information in a screenlet"
arch=('any')
url="http://gnome-look.org/content/show.php/InfoPanel+%28SysMonitor+PLUS%29?content=100042"
license=('GPL')
depends=('screenlets')
groups=('screenlets-extra')
source=(http://www.horejsek.com/document_root/files/InfoPanelScreenlet-$pkgver.tar.gz)
build() {
  mkdir -p $pkgdir/usr/share/screenlets/
  cp -r $srcdir/InfoPanel $pkgdir/usr/share/screenlets/
}

md5sums=('67d3118330eaf5d31e5fb82cd6daf61a')
