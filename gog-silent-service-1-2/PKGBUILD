# Maintainer : André Fettouhi <a.fettouhi@gmail.com>

pkgname=gog-silent-service-1-2
pkgver=1.0.0.5
pkgrel=1
pkgdesc="Prepare to dive into Silent Service, the submarine simulation that recreates authentic World War II sea patrols in the bloody waters of the South Pacific."
arch=("i686" "x86_64")
url="http://www.gog.com/game/silent_service_12"
license=("custom")
source=("gog_silent_service_1_2_${pkgver}.tar.gz"
  "gog-silent-service-1-2")
sha256sums=('3ca6012161a8e492f3d197955ca9b98a1f93641bde9837c396efff714e1a44c7'
            '707b8df1e9796323aff186761c9b9f699c122aed278d985fd4ffbffa2c065d8c')
depends=(libpng12 unionfs-fuse)

package() {
  mkdir -p "${pkgdir}"/opt/gog/silent-service-1-2
  cp -r "${srcdir}"/Silent\ Service\ 1+2/* "${pkgdir}"/opt/gog/silent-service-1-2
  install -Dm644 "${srcdir}"/Silent\ Service\ 1+2/support/gog-silent-service-1-2-primary.desktop "${pkgdir}"/usr/share/applications/gog-silent-service-1-2.desktop
  install -Dm644 "${srcdir}"/Silent\ Service\ 1+2/support/gog-silent-service-1-2.png "${pkgdir}"/usr/share/pixmaps/gog-silent-service-1-2.png
  install -Dm644 "${srcdir}"/Silent\ Service\ 1+2/docs/End\ User\ License\ Agreement.txt "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
  install -Dm755 "${srcdir}/gog-silent-service-1-2" "${pkgdir}/usr/bin/gog-silent-service-1-2"
}

PKGEXT=.pkg.tar 
