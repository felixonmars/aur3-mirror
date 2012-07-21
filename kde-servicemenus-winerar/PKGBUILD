# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=kde-servicemenus-winerar
pkgver=0.52
pkgrel=2
pkgdesc="Servicemenu which allows integration of WinRar via Wine."
arch=('any')
url="http://www.kde-apps.org/content/show.php/WineRar?content=67571"
license=('GPL')
depends=('kdebase-dolphin' 'wine')
source=(http://www.kde-apps.org/CONTENT/content-files/67571-winerar.tar.gz)
md5sums=('e7ad939b4da4f31512c34516b425ac80')

package() {

  cd $srcdir/winerar
  install -Dm644 winerar_kde4.desktop $pkgdir/usr/share/kde4/services/winerar_kde4.desktop
}