# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

_appname=x-wing
pkgname=x-wing-collector-cdrom
pkgver=1.5
pkgrel=1
pkgdesc="Space flight and combat simulator set in the Star Wars universe (uses DOSBox, CD-ROM required)"
arch=("any")
depends=("dosbox" "modfs-git")
makedepends=("convmv")
provides=("${_appname}")
conflicts=("${_appname}")
license=("custom")
url="http://www.lucasarts.com"
source=("http://www.softicons.com/download/tv-movie-icons/star-wars-icons-by-archigraphs/png/512/XWing_archigraphs.png"
        "lib${_appname}.sh"
        "${_appname}.sh"
        "${_appname}-config.sh"
        "${_appname}.desktop"
        "${_appname}-config.desktop"
        "01-user.conf"
        "99-base.conf")
md5sums=('e90c27f0ec3ebfa4fafa725c4c793403'
         '39f40b988191a515ed350e7af44e50bd'
         '8ffbadd65306d0d66521f00a39509ad3'
         '6cf374ed3933b81c107e64f619ac573b'
         '6cf54f29e8510b7df169605197ad4e7f'
         '52b0662ba73f60b9d6082d1b8ff75c38'
         'c1549ac03b636273288afaf4046f3ad0'
         '860aec170fd15723201b9bee8e28c499')
install="${pkgname}.install"

# Note: this PKGBUILD only works with the X-Wing Collector's CDROM edition of the game,
# *not* with the Floppy Disks edition nor the X-Wing Collector Series edition.

# Change this to the path where your X-Wing Collector's CDROM is mounted
: ${CD_DIR:="$HOME/media/Star_Wars__X-Wing_Collector's_CDROM_(US).iso/"}

package() {
  local baseDir="${pkgdir}/usr/share/games/${_appname}/base"

  # Copy data (case insensitive)
  cd "${CD_DIR}"

  local f
  for f in "./*.mdr" "./*.wdr" "./*.ovl" "./bootdisk.exe" "./bwing.exe" "./detect.exe" "./imuse.*" "./install.exe" \
           "./*.fnt" "./*.cfg" "./*.plt" "./read.me" "./test*" "./setmuse.*" "./*.xid" "./*.pac" "./classic/*" \
           "./cp/*" "./mission/*" "./resource/*" "./talk/**/*"; do
    find . -iwholename "${f}" -exec install -Dm644 "{}" "${baseDir}/{}" \;
  done

  # Fix case
  cd "${pkgdir}/usr/share/games/${_appname}"
  convmv --lower --notest -r *

  # Shell scripts
  install -Dm644 "${srcdir}/lib${_appname}.sh" "${pkgdir}/usr/lib/lib${_appname}.sh"
  install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
  install -Dm755 "${srcdir}/${_appname}-config.sh" "${pkgdir}/usr/bin/${_appname}-config"

  # .desktop file
  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm644 "${srcdir}/${_appname}-config.desktop" "${pkgdir}/usr/share/applications/${_appname}-config.desktop"

  # Icon
  install -Dm644 "${srcdir}/XWing_archigraphs.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"

  # Modfs
  install -Dm644 "${srcdir}/01-user.conf" "${pkgdir}/etc/${_appname}.d/01-user.conf"
  install -Dm644 "${srcdir}/99-base.conf" "${pkgdir}/etc/${_appname}.d/99-base.conf"
}
