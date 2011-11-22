# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=nwn-hotu-resources-cdrom
pkgdesc="Neverwinter Nights RPG from BioWare (Hordes Of The Underdark expansion resources, CD-ROM required)"
pkgver=1.69
pkgrel=1
arch=(any)
depends=("nwn-original-resources=$pkgver")
provides=("nwn-hotu-resources")
conflicts=("nwn-hotu-resources")
license=("custom")
url="http://nwn.bioware.com/downloads/linuxclient.html"
source=("http://files.bioware.com/neverwinternights/updates/linux/${pkgver//.}/English_linuxclient${pkgver//.}_xp2.tar.gz"
        "96-hotu-resources.conf")
md5sums=('b021f0da3b3e00848521926716fdf487'
         'c71b9a7f8e7642601e32a0a6d1549dd1')

# Package options
# Path to the HOTU cdrom mountpoint
: ${CD_DIR:="/media/sr0"}

package() {
  cd "${srcdir}"

  install -Dm644 "96-hotu-resources.conf" "${pkgdir}/etc/nwn/branches.d/96-hotu-resources.conf"

  install -d "${pkgdir}/opt/nwn/hotu-resources"

  # Data_Shared.zip
  unzip "${CD_DIR}/Data_Shared.zip" 'ambient/*' 'data/*' 'localvault/*' 'music/*' 'texturepacks/*' -d "${pkgdir}/opt/nwn/hotu-resources"

  # Language_Data.zip
  unzip "${CD_DIR}/Language_Data.zip" -x xp2patch.key data/xp2patch.bif  -d "${pkgdir}/opt/nwn/hotu-resources"
  mv "${pkgdir}/opt/nwn/hotu-resources/NWNHordes_Manual.pdf" "${pkgdir}/opt/nwn/hotu-resources/docs"

  # Patch
  local f
  for f in xp2patch.key data/xp2patch.bif nwm/XP2*.nwm texturepacks/*; do
    install -Dm644 "${f}" "${pkgdir}/opt/nwn/hotu-resources/${f}"
  done
}
