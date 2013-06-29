# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

pkgname=gtk-theme-sugarlike
pkgver=1
pkgrel=1
pkgdesc="Some GTK and Xfwm themes inspired by the metacity Sugar theme"
arch=(any)
url="http://xfce-look.org/content/show.php/SugarLike?content=111097"
license=('GPL')
source=(http://xfce-look.org/CONTENT/content-files/111097-SugarLike.tar.gz)
md5sums=('f9395aac53a61c04228f93d1348e9a2e')

package() {
  mkdir -p $pkgdir/usr/share/themes
  cp -R $srcdir/Sugar* $pkgdir/usr/share/themes
}
