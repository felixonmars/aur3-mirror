# Maintainer: boenki <boenki at gmx dot de>
# Contributor:Josip <josipponjavic at gmail dot com>

pkgname=breathe-icon-theme
pkgver=0.51
pkgrel=2
pkgdesc="Set of icons mixing KDEs "Oxygen" with Ubuntus "Human" set"
arch=('any')
url="https://wiki.ubuntu.com/Artwork/BreatheIconSet"
license=('CCPL:by-sa' 'custom:TRADEMARKS')
conflicts=('gnome-icons-breathe')
makedepends=('librsvg')
options=(!strip !zipman)
source=(http://launchpad.net/breathe-icon-set/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz
        http://cinderwick.ca/files/archlinux/artwork-official/symbol.svg
        http://cinderwick.ca/files/archlinux/licensing-docs/TRADEMARKS)
md5sums=('1654eeb36246adf2556b84595bfb6e07'
         'e9c0c2e165f2883c3fa00277635ae4ae'
         '05066419eb8239652a0467131485db4d')

package() {
  install -d "${pkgdir}/usr/share/icons/breathe"
  cp -r ${pkgname}-${pkgver}/* "${pkgdir}/usr/share/icons/breathe"

  install -D TRADEMARKS "${pkgdir}/usr/share/licenses/${pkgname}/TRADEMARKS"

  # Replace ubuntu logo with Arch Linux's
  # Create icon for category "Education"
  cd "${pkgdir}/usr/share/icons/breathe"
  for size in 16 22 24 32 48; do
    rsvg-convert -w ${size} -h ${size} "${srcdir}/symbol.svg" -o "${size}x${size}/places/start-here.png"
    ln -s applications-science.png "${size}x${size}/categories/applications-education.png"
  done
  install -D ${srcdir}/symbol.svg "scalable/places/start-here.svg"
  ln -s applications-science.svg "scalable/categories/applications-education.svg"

  find ${pkgdir} ! -type d -exec chmod 644 {} +
}
