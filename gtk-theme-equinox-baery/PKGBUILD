# Maintainer: Tiago Vale <tiagomarquesvale at gmail.com>

pkgname=gtk-theme-equinox-baery
pkgver=1.1
pkgrel=4
pkgdesc="Modified version of Equinox Radiance (now called Equinox Variance)"
url="http://gnome-look.org/content/show.php/Equinox+Baery?content=125046"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk-engine-equinox>=1.30')
changelog="CHANGELOG"
source=("http://gnome-look.org/CONTENT/content-files/125046-equinox-baery-${pkgver}.tar.gz")
md5sums=('3b1e34a367d11261b4e9372c52f98ba6')
sha256sums=('ef3f757a807e148b8bbbb4e10a57f9b50673058086dbf89f8bb7384b5eca876a')

package() {
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -r "${srcdir}"/"Equinox Baery"{," Cy3"} "${pkgdir}"/usr/share/themes
  chown -R root:root "${pkgdir}"/usr
}
