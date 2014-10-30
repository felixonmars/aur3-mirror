# Maintainer: Sfincs <sfincs120 at gmail dot com>

pkgname=plasma-theme-unity-ambiance
pkgver=1.8
pkgrel=1
pkgdesc="Ubuntu Ambiance theme for KDE"
arch=('any')
url="http://kde-look.org/content/show.php/Unity+Ambiance?content=159937"
license=('GPL')
depends=(kdebase-workspace)
source=(http://kde-look.org/CONTENT/content-files/159937-UnityAmbiance.tar.gz)
md5sums=('d85bceebff57888ac0ea9437426daec5')

package() {
  cd $srcdir
	tar xf 159937-UnityAmbiance.tar.gz
	mkdir -p "$pkgdir/usr/share/apps/desktoptheme"
	cp -r "$srcdir/UnityAmbiance" "$pkgdir/usr/share/apps/desktoptheme"

}

