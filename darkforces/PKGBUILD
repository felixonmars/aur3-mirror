# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=darkforces
pkgver=1.0
pkgrel=1
pkgdesc="FPS set in the Star Wars universe (uses DOSBox, CD-ROM required)"
arch=("any")
depends=("dosbox" "dos32a" "modfs-git")
makedepends=("convmv")
license=("custom")
url="http://www.lucasarts.com"
source=("lib${pkgname}.sh"
        "${pkgname}.sh"
        "${pkgname}-config.sh"
        "${pkgname}.desktop"
        "${pkgname}-config.desktop"
        "${pkgname}.png"
        "01-user.conf"
        "99-base.conf")
md5sums=('cc3b60d184708f90c2328723327a900d'
         '5a93904ef30db54eff31493120261809'
         'd98c8342cb29c13bf9a951de1f772497'
         '008af5c1003d5fbdae67ded60e740079'
         '8dc304f75e1c3e2bfa3d63f7cfd3aae4'
         '341b165346b0ed1769fa012b9f8b2d9e'
         'c1549ac03b636273288afaf4046f3ad0'
         'c0c9a8d696f4ab3b8d9073c80aa48c48')
install="${pkgname}.install"

# Change this to the path where your Dark Forces CDROM is mounted
: ${CD_DIR:="$HOME/media/Star_Wars__Dark_Forces_(FR).iso/"}

package() {
  local baseDir="${pkgdir}/usr/share/games/${pkgname}/base"
  # Copy data (case insensitive)
  cd "${CD_DIR}"

  local f
  for f in "./cd.id" "./dark/*.gob" "./dark/*.ini" "./dark/*.cfg" "./dark/*.msg" "./dark/lfd/*.lfd" "./dark/dark.exe" "./dark/imuse.exe"; do
    find . -maxdepth 3 -iwholename "${f}" -exec install -Dm644 "{}" "${baseDir}/{}" \;
  done

  for f in install.exe bootmkr.exe readme.txt; do
    find . -maxdepth 1 -iname "${f}" -exec install -Dm644 "{}" "${baseDir}/dark/{}" \;
  done
  
  # Fix case
  cd "${pkgdir}/usr/share/games/${pkgname}"
  convmv --lower --notest -r *

  # Use DOS32/A instead of DOS4/GW
  ln -s "/usr/share/dos32a/dos32a.exe" "${baseDir}/dark/dos4gw.exe"

  # Tell Dark Forces to look at drive C
  echo -n "C" > "${baseDir}/dark/drive.cd"

  # Shell scripts
  install -Dm644 "${srcdir}/lib${pkgname}.sh" "${pkgdir}/usr/lib/lib${pkgname}.sh"
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-config.sh" "${pkgdir}/usr/bin/${pkgname}-config"

  # Install .desktop files
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-config.desktop" "${pkgdir}/usr/share/applications/${pkgname}-config.desktop"

  # Install icon
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  
  # Modfs
  install -Dm644 "${srcdir}/01-user.conf" "${pkgdir}/etc/${pkgname}.d/01-user.conf"
  install -Dm644 "${srcdir}/99-base.conf" "${pkgdir}/etc/${pkgname}.d/99-base.conf"
}

