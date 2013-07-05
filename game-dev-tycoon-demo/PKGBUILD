# Maintainer: Jon Gjengset <jon@tsp.io>
# Based on PKGBUILD for oilrush
# Repository here: https://github.com/Jonhoo/gamedevtycoon-PKGBUILD
# Changelog here: http://www.greenheartgames.com/game-dev-tycoon-changelog/
pkgname=game-dev-tycoon-demo
pkgver=1.3.9
pkgrel=1
pkgdesc="a business simulation game where you start a video game development company"
arch=('i686' 'x86_64')
makedepends=('unzip')
depends=('mesa' 'node-webkit' 'alsa-lib')
conflicts=('game-dev-tycoon-demo')
provides=()
options=(!strip)
PKGEXT=".pkg.tar" # Because we don't want to recompress everything
                  # Compressing takes time and only saves about 6MB anyway
license=("commercial")
url="http://www.greenheartgames.com/app/game-dev-tycoon/"
_gamerel="1"
_gamepkg="gamedevtycoon-demo-${pkgver}-${_gamerel}-${CARCH/x86_64/x64}.tar.gz"
source=("http://www.greenheartgames.com/files_public/${_gamepkg}"
        'game-dev-tycoon-demo'
        'game-dev-tycoon-demo.desktop')
md5sums=('SKIP' # md5 would depend on CARCH
         'ae28f2cd5480964f05cf5699f3f1693c'
         'eef2e3997cdf6758ff10bde13b825406')

build() {
  cd ${srcdir}

  _gamemd5='880454d73e01bac4e80612aec200c99d'
  if [[ ${CARCH} == "i386" ]]; then
    _gamemd5='443885921d62d89ed3bdaf6fa545fd58'
  fi

  if [[ ! (`md5sum ${_gamepkg} | cut -f1 -d' '` == "${_gamemd5}") ]]; then
    error "Game file seems to be a different version, problems may occur!"
  fi
  msg "Found game file, installing..."

  cd "${_gamepkg%.tar.gz}"

  msg2 "Extracting game files"
  if [[ -e ../app.nw ]]; then
    rm -rf ../app.nw
  fi
  unzip -qq gamedevtycoon-bin -d ../app.nw && true

  # package.png is prettier than icon.png (transparent background)
  mv ../app.nw/package.png ../launcher.png
}

package() {
  cd "${srcdir}"
  install -d ${pkgdir}/opt/greenheartgames/${pkgname%-demo}

  msg2 "Copy game files"
  cp -R ${srcdir}/{app.nw,launcher.png} \
    ${pkgdir}/opt/greenheartgames/${pkgname%-demo}/

  # Install Launcher
  msg2 "Install launcher to /usr/bin"
  install -D -m755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # Install Desktop
  msg2 "Add .desktop file"
  install -D -m644 ${srcdir}/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
