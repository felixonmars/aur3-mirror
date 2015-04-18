# Contributor: flow

pkgname=gtk-nova-theme
pkgver=1.0
pkgrel=2
pkgdesc="Theme nova for GTK"
arch=('any')
url="http://gnome-look.org/content/show.php/Nova?content=57310"
license=('GPL')
depends=('gtk-engine-mist')
source=(http://www.gnome-look.org/CONTENT/content-files/57310-Nova.tar.gz)
md5sums=('c04bbccf071bd30ee410233312d8c215')

package() {
  cd ${srcdir}/Nova/
  install -d ${pkgdir}/usr/share/themes/

  tar -zxvf Nova-Blue-gtk.tar.gz
  tar -zxvf Nova-Gold-gtk.tar.gz
  tar -zxvf Nova-Lime-gtk.tar.gz
  tar -zxvf Nova-Pink-gtk.tar.gz

  cp -r "Nova-Blue" "Nova-Gold" "Nova-Lime" "Nova-Pink" ${pkgdir}/usr/share/themes/
}
