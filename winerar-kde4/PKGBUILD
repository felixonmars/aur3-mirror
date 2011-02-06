# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=winerar-kde4
pkgver=0.52
pkgrel=1
pkgdesc="Servicemenu which allows integration of WinRar via Wine."
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/WineRar?content=67571"
license=('GPL')
depends=('wine')
source=(http://www.kde-apps.org/CONTENT/content-files/67571-winerar.tar.gz)
md5sums=('e7ad939b4da4f31512c34516b425ac80')

build() {
  cd $srcdir/winerar

  install -Dm644 winerar_kde4.desktop $pkgdir/home/$USER/.kde4/share/kde4/services/ServiceMenus/winerar_kde4.desktop
}
