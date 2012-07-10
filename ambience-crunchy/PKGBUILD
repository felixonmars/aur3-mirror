# Maintainer: debdj <debd92@gmail.com>

pkgname=ambience-crunchy
pkgver=136162
pkgrel=1
pkgdesc='Ambiance like Theme for Openbox, Xfce, Gnome2/3, Unity/Gnome-Shell.'
arch='any'
url="http://box-look.org/content/show.php/Ambiance+Crunchy?content=136162"
license=GPL
depends=('gtk-engine-murrine' 'gtk-engine-unico')
source="http://box-look.org/CONTENT/content-files/$pkgver-Crunchy-themes.tar.gz"
md5sums='d2b0e863f2b24317adfe66032caf0e62'

package() {
  cd "${srcdir}/themes"

  mkdir -p ${pkgdir}/usr/share/themes/
  cp -R * ${pkgdir}/usr/share/themes/
  chmod -R 644 ${pkgdir}/usr/share/themes
}
