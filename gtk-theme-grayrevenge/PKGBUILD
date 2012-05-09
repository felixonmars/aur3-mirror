# Maintainer: Alois Nespor <info@aloisnespor.info> 

pkgname=gtk-theme-grayrevenge
pkgver=1.7
pkgrel=1
pkgdesc="GrayRevenge is a complete suite for GNOME 3.4. GTK2, GTK3, Metacity, Unity, Gnome-shell, Cinnamon, Xfwm themes. Slick, fast, and elegant."
url="http://alecive.deviantart.com/art/Gray-Revenge-1-5-194633730"
license=('by-nc-sa-3.0')
arch=('any')
depends=('gtk-engine-murrine>=0.98.1.1' 'gtk-engine-unico>=1.0.2')
optdepends=('xfwm4: for XFCE theme'
            'gnome-shell: for Gnome Shell theme'
            'awoken-icons: recommended Icons theme')
source=("http://www.deviantart.com/download/194633730/gray_revenge___1_7_by_alecive-d37voci.zip")



package() {
  mkdir -p ${pkgdir}/usr/share/themes/
  cd ${srcdir}/GrayRevenge/1.\ GTK2\,GTK3\,Metacity\,Unity\,Gnome-shell\,Cinnamon\,xfwm\ theme/
  cp -r *  ${pkgdir}/usr/share/themes/GrayRevenge
  find "${pkgdir}" -name *~ -exec rm '{}' \;
  
}


sha256sums=('3efbae5cc42c2d16d359f8dba8f826d4d78d9ae0f235aa3b31a0dee4d73f86ef')
