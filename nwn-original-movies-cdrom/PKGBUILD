# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=nwn-original-movies-cdrom
pkgver=1.69
pkgrel=1
pkgdesc="Neverwinter Nights RPG from BioWare (original game movies, NWN CD3 required)"
arch=("any")
license=("custom")
depends=("nwn-original-resources")
url="http://nwn.bioware.com/downloads/linuxclient.html"
source=("98-original-movies.conf")
md5sums=('2494ac93b1c6464e2971323adf1a0556')

# Package options
# CD_DIR: path where Neverwinter Nights CD3 is mounted.
: ${CD_DIR:="/media/sr0"}

package() {
  cd "${srcdir}"
  install -Dm644 "98-original-movies.conf" "${pkgdir}/etc/nwn/branches.d/98-original-movies.conf"
  
  cd "${CD_DIR}/movies"
  local i
  for i in *.bik; do
    install -Dm644 "${i}" "${pkgdir}/opt/nwn/original-movies/movies/${i}"
  done
}

