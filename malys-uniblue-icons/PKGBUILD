# Maintainer: Pratik Sinha <pratik@humbug.in>

pkgname=malys-uniblue-icons
pkgver=1.7
pkgrel=1
pkgdesc="Malys Uniblue Icon Theme"
arch=('any')
url="http://malysss.deviantart.com/gallery/#/d4xpxik"
license=('GPL')
depends=('gnome-icon-theme' 'hicolor-icon-theme')
makedepends=('icon-naming-utils')
provides=("malys-uniblue-icons=${pkgver}")
conflicts=('malys-uniblue-icons')
install=${pkgname}.install
source=("https://launchpad.net/~noobslab/+archive/icons/+files/malys-uniblue_${pkgver}~quantal.tar.gz")
sha512sums=('3531d2fd4c39cb3c0af7db58eb7f7e019153f8edd9300ee84c6ba5ec5f2fbb60d5ce0b884f3213508062211d414d560209e8b429c7a2bf95ee131a2d122292e8')

package() {
  cd "${srcdir}/malys-uniblue-icons"

  # Install Humanity icon theme
  find malys-uniblue -type f -exec install -Dm644 {} "${pkgdir}"/usr/share/icons/{} \;

  # From debian/rules
  for i in $(find "${pkgdir}/usr/share/icons/" -mindepth 2 -maxdepth 2 -type d); do
    (
    if [ "$(basename ${i})" = "malys" ]; then
      continue
    fi
    cd "${i}"
    for j in *; do
      /usr/lib/icon-naming-utils/icon-name-mapping -c "${j}"
    done
    )
  done
}

# vim:set ts=2 sw=2 et:
