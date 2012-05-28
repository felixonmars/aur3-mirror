# Maintainer: hank863

pkgname=gtk-theme-adwaita-x
pkgver=1.02
pkgrel=1
pkgdesc="A gtk2 theme that mimics Adwaita."
arch=('any')
url="http://gnome-look.org/content/show.php?content=149403"
license=('GPL')
depends=('gtk-engines' 'gtk-engine-murrine')
source=("http://gnome-look.org/CONTENT/content-files/149403-Adwaita-X-1.02-1.tar.gz")
md5sums=('a414adfb1fb2045dc227581ddf98fb5f')


package() {
  cd ${srcdir}
  tar -zxf 149403-Adwaita-X-1.02-1.tar.gz || return 1
  ln -s /usr/share/themes/Adwaita/gtk-3.0 Adwaita-X/gtk-3.0
  install -d ${pkgdir}/usr/share/themes || return 1
  cp -r ${srcdir}/Adwaita-X  ${pkgdir}/usr/share/themes || return 1
}
