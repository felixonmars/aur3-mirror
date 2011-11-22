# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=nwn-sou-resources-cdrom
pkgdesc="Neverwinter Nights RPG from BioWare (Shadows Of Undrentide expansion resources, CD-ROM required)"
pkgver=1.69
pkgrel=1
arch=(any)
depends=("nwn-original-resources=${pkgver}")
provides=(nwn-sou-resources)
conflicts=(nwn-sou-resources)
license=("custom")
url="http://nwn.bioware.com/downloads/linuxclient.html"
source=("http://files.bioware.com/neverwinternights/updates/linux/${pkgver//.}/English_linuxclient${pkgver//.}_xp1.tar.gz"
        "97-sou-resources.conf")
md5sums=('8b41c88366e1de8933d48b178ca3de0e'
         '014631d7c93b8a2e621a2b3dc0c860fb')

# Package options
# Path to the SOU cdrom mountpoint
: ${CD_DIR:="/media/cdrom"}

package() {
  cd "${srcdir}"
  
  install -Dm644 "97-sou-resources.conf" "${pkgdir}/etc/nwn/branches.d/97-sou-resources.conf"
  install -d "${pkgdir}/opt/nwn/sou-resources"
  
  # Data_Shared.zip
  unzip "${CD_DIR}/Data_Shared.zip" 'data/*' 'music/*' 'texturepacks/*' -d "${pkgdir}/opt/nwn/sou-resources"
  
  # Language_Data.zip
  unzip "${CD_DIR}/Language_Data.zip" -x "xp1patch.key" "data/xp1patch.bif"  -d "${pkgdir}/opt/nwn/sou-resources"
  
  # Patch
  local f
  for f in xp1patch.key data/xp1patch.bif nwm/XP1*.nwm; do
    install -Dm644 "${f}" "${pkgdir}/opt/nwn/sou-resources/${f}"
  done
}
