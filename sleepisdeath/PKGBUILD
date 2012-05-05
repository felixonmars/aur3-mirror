# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Chris Baker <youremail@domain.com>

pkgname=sleepisdeath
pkgver=16
pkgrel=1
pkgdesc="A storytelling game for two players by Jason Rohrer"
arch=('i686' 'x86_64')
url="http://sleepisdeath.net/"
license=('custom:commercial')
depends=('libpng' 'mesa' 'sdl')
install="${pkgname}.install"
source=("${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh")
md5sums=('875d997ca4caefcbfe599f5e37361944'
         'f55575ef02cf2a1da79675fc9af12821'
         'ff4b365ec9522326b6d9478a5a9eed55')

_gamepkg="SleepIsDeath_v${pkgver}_UnixSource.tar.gz"
_gamemd5='1032f1d2065abc96ee7f80a8d6d09fda'

build() {
  cd "${srcdir}"

  # Check game archive
  if [[ ! -f "${_gamepkg}" ]]; then
    msg "!! 'Sleep Is Death' is a commercial game."
    msg "!! You need a full copy of this game in order to install it."
    msg "!! Please copy ${_gamepkg} to ${srcdir}" && return 1
  else
    if [[ "$(md5sum ${_gamepkg} | awk '{print $1}')" == "${_gamemd5}" ]]; then
      msg "!! Check: ${_gamepkg} is the correct."
    else
      msg "!! Check: ${_gamepkg} didn't match md5sum. Exiting!" && return 1
    fi
  fi

  # Extract game archive
  bsdtar -xf "${_gamepkg}"

  # Compile
  cd "SleepIsDeath_v${pkgver}_UnixSource"
  ./runToBuild 1
}

package() {
  cd "${srcdir}/SleepIsDeath_v${pkgver}_UnixSource"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -R graphics importOldCache languages loadingBay \
        resourceCache settings templates SleepIsDeathApp *.txt \
        "${pkgdir}/opt/${pkgname}"

  # Set permissions
  chgrp -R games "${pkgdir}/opt/${pkgname}"
  chmod -R g+w "${pkgdir}/opt/${pkgname}"

  # Install launchers
  install -Dm755 "../${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/SleepIsDeathApp"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
