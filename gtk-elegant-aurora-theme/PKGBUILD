# Maintainer: Astor Castelo <amcastelo[at]gatech[dot]edu>
# Contributor: Alessio Sergi <asergi[at]archlinux[dot]us>

pkgname=gtk-elegant-aurora-theme
pkgver=1.2
pkgrel=3
pkgdesc="Theme for Aurora GTK+ engine"
arch=('any')
url="http://www.gnome-look.org/content/show.php/Elegant+Aurora?content=79536"
license=('GPL')
depends=('gtk-aurora-engine')
source=(http://www.gnome-look.org/CONTENT/content-files/79536-ElegantAurora.tar.bz2)
md5sums=('6b738664aa16222f2d49f5faacee2f27')

package() {
  cd ${srcdir}/Elegant\ Aurora

  install -d ${pkgdir}/usr/share/themes/Elegant-Aurora
  cp -R * ${pkgdir}/usr/share/themes/Elegant-Aurora
}
