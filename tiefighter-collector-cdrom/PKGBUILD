# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

_appname="tiefighter"
pkgname=tiefighter-collector-cdrom
pkgver=1.0
pkgrel=1
pkgdesc="Space flight and combat simulator set in the Star Wars universe (uses DOSBox, CD-ROM required)"
arch=("any")
depends=("dosbox" "dos32a" "modfs-git")
makedepends=("imagemagick" "convmv")
provides=("tiefighter")
conflicts=("tiefighter")
license=("custom")
url="http://www.lucasarts.com"
source=("tiecdjoy.zip::ftp://ftp.lucasarts.com/patches/pc/tiecdjoy.exe"
        "lib${_appname}.sh"
        "${_appname}.sh"
        "${_appname}-config.sh"
        "${_appname}.desktop"
        "${_appname}-config.desktop"
        "01-user.conf"
        "99-base.conf")
md5sums=('4153517873ca47afc92e12ed3005c826'
         '49f8c05c0a4072c664b396e327580ca4'
         '24159faffb133b0f84b8967f10ffce67'
         '0042e5874663a8811522235eb1a1c1bc'
         'fa249261f740c128a833fc96f5843849'
         'cc6577266586b609b295a9659301c41a'
         'c1549ac03b636273288afaf4046f3ad0'
         '08febcafc6898cd05363c7a24c108bd8')
install="${pkgname}.install"

# Note: this PKGBUILD only works with the Tie Fighter Collector's CDROM edition of the game,
# *not* with the Floppy Disks edition nor the X-Wing Collector Series edition (aka TIE95).

# Change this to the path where your Tie Fighter Collector's CDROM is mounted
: ${CD_DIR:="$HOME/media/Star_Wars__Tie_Fighter_Collector's_CDROM_(US).iso/"}

build() {
  cd "${srcdir}"
  convert "${CD_DIR}/tie01.ico" "${_appname}.png"
}

package() {
  local diskDir="${pkgdir}/usr/share/games/${_appname}/disk"
  local baseDir="${pkgdir}/usr/share/games/${_appname}/base"

  # Copy data (case insensitive)
  cd "${CD_DIR}"

  local f
  for f in "./detvesa.exe" "./*.fnt" "read.me" "./*.dat" "./tie.exe" "./uvconfig.exe" "./vga.pac" \
           "./z_tie2__.exe" "./astream/*" "./cp*/*.lfd" "./cp*/*.pnl" "./cp*/*.int" "./mission/*" \
           "./res*/*" "./voice/**/*" "./imuse.exe"; do
    find . -iwholename "${f}" -exec install -Dm644 "{}" "${diskDir}/{}" \;
  done

  for f in "imuse.ini" "*.tfr"; do
    find . -maxdepth 1 -iname "${f}" -exec install -Dm644 "{}" "${baseDir}/{}" \;
  done

  # imuse.exe must be present on both diskDir and baseDir
  ln -s "/usr/share/games/${_appname}/disk/imuse.exe" "${baseDir}/imuse.exe"

  # Use DOS32/A instead of DOS4/GW
  ln -s "/usr/share/dos32a/dos32a.exe" "${diskDir}/dos4gw.exe"

  # Tell where Tie Fighter is installed
  echo -n 'C:\' > "${baseDir}/tie.cd"

  # Fix case
  cd "${pkgdir}/usr/share/games/${_appname}"
  convmv --lower --notest -r *

  # Joystick patch
  install -Dm644 "${srcdir}/z_tie__.exe" "${diskDir}/z_tie__.exe"

  # Shell scripts
  install -Dm644 "${srcdir}/lib${_appname}.sh" "${pkgdir}/usr/lib/lib${_appname}.sh"
  install -Dm755 "${srcdir}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"
  install -Dm755 "${srcdir}/${_appname}-config.sh" "${pkgdir}/usr/bin/${_appname}-config"

  # .desktop file
  install -Dm644 "${srcdir}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"
  install -Dm644 "${srcdir}/${_appname}-config.desktop" "${pkgdir}/usr/share/applications/${_appname}-config.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${_appname}.png"

  # Modfs
  install -Dm644 "${srcdir}/01-user.conf" "${pkgdir}/etc/${_appname}.d/01-user.conf"
  install -Dm644 "${srcdir}/99-base.conf" "${pkgdir}/etc/${_appname}.d/99-base.conf"
}
