# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=rebelassault
pkgver=1.8
pkgrel=1
pkgdesc="Action game set in the Star Wars universe (uses DOSBox, CD-ROM required)"
arch=("any")
depends=("dosbox" "dos32a")
makedepends=("convmv")
license=("custom")
url="http://www.lucasarts.com"
source=("reb18.zip::ftp://ftp.lucasarts.com/patches/pc/reb18.exe"
        "http://icons.iconarchive.com/icons/3xhumed/mega-games-pack-29/256/Star-Wars-Rebel-Assault-1-icon.png"
        "lib${pkgname}.sh"
        "${pkgname}.sh"
        "${pkgname}.desktop")
md5sums=('cee08a288d8d2e18b4ecf4c2fc304dc5'
         '28f18180a1d4a4c690d7ecc1b0912c6d'
         'e01625a42538f4f0f513b3d10996f570'
         'ad359a72785ef938d2edb36d5f0f4a76'
         '786abf4cc25641a6ddbdfb5715654f6c')
install="${pkgname}.install"

# Change this to the path where your Rebel Assault CDROM is mounted
: ${CD_DIR:="$HOME/media/Rebel_Assault.iso/"}

package() {
  local diskDir="${pkgdir}/usr/share/games/${pkgname}"

  # Copy data (case insensitive)
  cd "${CD_DIR}"

  local f
  for f in "./cut*/*" "./fin/*" "./font/*" "./lvl*/*" "./open/*" "./sys/*"; do
    find . -iwholename "${f}" -exec install -Dm644 "{}" "${diskDir}/{}" \;
  done

  # Use DOS32/A instead of DOS4/GW
  ln -s "/usr/share/dos32a/dos32a.exe" "${diskDir}/dos4gw.exe"

  # 1.8 patch
  for f in "ASSAULT.EXE" "BOOTDISK.EXE" "REBEL.EXE"; do
    install -Dm644 "${srcdir}/${f}" "${diskDir}/${f}"
  done

  # Fix case
  cd "${diskDir}"
  convmv --lower --notest -r *

  # Shell scripts
  install -Dm644 "${srcdir}/lib${pkgname}.sh" "${pkgdir}/usr/lib/lib${pkgname}.sh"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  # .desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Icon
  install -Dm644 "${srcdir}/Star-Wars-Rebel-Assault-1-icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
