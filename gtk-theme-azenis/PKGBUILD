# Contributor: Calimero <calimeroteknik@free.fr>

pkgname=gtk-theme-azenis
pkgver=0.7
pkgrel=1
pkgdesc="Azenis GTK 2.0 dark theme"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2')
url=('http://www.gnome-look.org/content/show.php/Azenis?content=106608')
source=('https://sites.google.com/site/jameshardy88/jameshardy88/Azenis.tar.gz')
md5sums=('c2d378f39a36dceb108df0a5b043f033')

build() {
  mkdir -p "${pkgdir}/usr/share/themes/Azenis"
  cp -r "${srcdir}"/Azenis/* "${pkgdir}/usr/share/themes/Azenis/"
}
