# Mainteiner: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: twa022 <twa022@gmail.com>

pkgname=xfwm-theme-oxygen
pkgver=20080901
pkgrel=1
pkgdesc="Oxygen Theme for Xfwm"
arch=(any)
url="http://xfce-look.org/content/show.php/Oxygen-xfwm4?content=88368"
license=('GPL')
depends=('xfwm4')
source=(http://xfce-look.org/CONTENT/content-files/88368-Oxygen-xfwm4.tar.gz)
md5sums=('560441962d0c9f93e1d711f27c397c8a')

package() {
  mkdir -p $pkgdir/usr/share/themes/
  cp -r $srcdir/Oxygen-xfwm4 $pkgdir/usr/share/themes/
}
