# Maintainer: Philip Babu <sasha.1594@gmail.com>
pkgname=smoothx-xfce
pkgver=0.2
pkgrel=8
pkgdesc="Complete icon set's for XFCE desktop environment"
url="https://github.com/sasha1594/smoothX-Xfce"
arch=('any')
license=('GPLv3')
depends=('gtk-update-icon-cache' 'gnome-icon-theme' 'librsvg')
source=("https://github.com/sasha1594/smoothX-Xfce/archive/0.2.8.zip")
optdepends=()
makedepends=()
conflicts=()
options=(!strip)
install='smoothx.install'
md5sums=('09498d1539535294ef3e713631b1c361')


package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -Rf  smoothX-Xfce-0.2.8/smoothX* "${pkgdir}/usr/share/icons/"
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;

}
