# Contributor: Wido <widowild[AT]myopera[dot]com>

pkgname=gtk-laza-theme
pkgver=0.2
pkgrel=3
pkgdesc="Theme laza for GTK"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Laza+Theme+Pack?content=64953"
license=('GPL')
depenids=('gtk2-xfce-engine')
source=(http://www.gnome-look.org/CONTENT/content-files/64953-Laza.tar.gz)
md5sums=('05b8d9ef91f6d6fd684121b54d060081')

build() {
  cd ${srcdir}/Laza/
  install -d ${pkgdir}/usr/share/themes/
  tar -zxvf Laza-gtk2.tar.gz
  cp -r "Laza" ${pkgdir}/usr/share/themes/
}
