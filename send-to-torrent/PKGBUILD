pkgname=send-to-torrent
pkgver=0.0.3
pkgrel=1
pkgdesc="Share files from the file browser"
arch=('any')
url="http://repo.hackcoop.com.ar/send-to-torrent.git/"
license=("AGPL3")
source=("http://repo.hackcoop.com.ar/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.xz")
md5sums=('e9d465ebec3abd1e142731f53adf8cf2')
depends=("bash" "mktorrent" "xdg-utils")
optdepends=("libnotify: desktop notifications"
            "transmission-cli: transmission support"
            "opentracker: local sharing support")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"

  make TARGET="${pkgdir}" PREFIX="/usr" install
}
