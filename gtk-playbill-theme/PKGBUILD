# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=gtk-playbill-theme
pkgver=2010111907
pkgrel=1
pkgdesc="Theme playbill blue and red for GTK"
arch=('any')
url="http://opendesktop.org/content/show.php/playbill+blue+and+red?content=108360"
license=('GPL')
depends=('gtk2' 'emerald')
source=(http://gnome-look.org/CONTENT/content-files/94076-Playbill.tar.gz)
md5sums=('0791ddcba2aeb75fe9359352138c2ee6')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/themes/
  # Gtk
  tar -zxvf GTK.tar.gz
  cp -r "${srcdir}/Playbill Blue" ${pkgdir}/usr/share/themes/
  cp -r "${srcdir}/Playbill Red" ${pkgdir}/usr/share/themes/
  rm -R "${srcdir}/Playbill Blue" "${srcdir}/Playbill Red"

  # Emerald
  install -d ${pkgdir}/usr/share/emerald/themes/
  tar -zxvf Emerald.tar.gz
  cp -r "${srcdir}/Playbill Blue" ${pkgdir}/usr/share/emerald/themes/
  cp -r "${srcdir}/Playbill Red" ${pkgdir}/usr/share/emerald/themes/
}
