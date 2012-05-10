# Maintainer: Alois Nespor <info@aloisnespor.info> 

pkgname=xfwm-theme-grayrevenge
pkgver=1.7
pkgrel=1
pkgdesc="Slick, fast, and elegant Xfwm theme. This is only for Xfwm."
url="http://alecive.deviantart.com/art/Gray-Revenge-1-5-194633730"
license=('by-nc-sa-3.0')
arch=('any')
depends=('gtk-engine-murrine>=0.98.1.1')
source=("http://www.deviantart.com/download/194633730/gray_revenge___1_7_by_alecive-d37voci.zip")
conflicts=('gtk-theme-grayrevenge')


package() {
  mkdir -p ${pkgdir}/usr/share/themes/Grayrevenge/xfwm4
  cd ${srcdir}/GrayRevenge/1.\ GTK2\,GTK3\,Metacity\,Unity\,Gnome-shell\,Cinnamon\,xfwm\ theme/GrayRevenge/xfwm4
  cp -r *  ${pkgdir}/usr/share/themes/Grayrevenge/xfwm4/
  find "${pkgdir}" -name *~ -exec rm '{}' \;
  
}


sha256sums=('3efbae5cc42c2d16d359f8dba8f826d4d78d9ae0f235aa3b31a0dee4d73f86ef')
