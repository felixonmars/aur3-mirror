# Maintainer: Wido <widomaker2k7 at gmail dot com>

pkgname=beep-game
_pkgname=beep
pkgver=1.3
pkgrel=2
pkgdesc="a 2D side-scrolling platformer with physics-based gameplay. (requires copy of the full game)"
url="http://www.gameolith.com/game/beep/"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
makedepends=()
options=(!strip)
install=(${_pkgname}.install)
source=("beep.sh" "beep.desktop")
md5sums=('c9667467d8fcb493cf9cfa0f94b9f99d'
         'e2be3a0703613f203a358687c0c7ca05')

_gamepkg="${_pkgname}_${pkgver}_i386.tar.gz"
depends=('mesa')
_depends64=('lib32-mesa')

if [[ $CARCH == x86_64 ]]; then
  depends=(${_depends64[@]})
fi

build() {
   cd ${srcdir}
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: \"$startdir\""
   pkgpath=$startdir
   if [[ ! -f "$startdir/${_gamepkg}" ]]; then
       error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ ! -f "${pkgpath}/${_gamepkg}" ]]; then
           error "Unable to find game package." && return 1
       fi
    fi
    msg "Found game package, installing..."

    ln -fs ${pkgpath}/${_gamepkg} . || return 1
    tar xvf ${pkgpath}/${_gamepkg} || return 1

  install -d ${pkgdir}/opt/${_pkgname}
  cp -R ${srcdir}/BEEP/{lib,Art} ${pkgdir}/opt/${_pkgname}/
  cp ${srcdir}/BEEP/{BEEP.bin32,RUNBEEP.sh} ${pkgdir}/opt/${_pkgname}/

}

package(){
  cd ${srcdir}

  # Install Launcher
  install -Dm 755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}-game

  # Install Desktop
  install -D -m644 ${srcdir}/${_pkgname}.desktop \
        ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # Install license
  install -D -m644 ${srcdir}/BEEP/EULA.rtf ${pkgdir}/usr/share/licenses/beep-game/EULA.rtf

  # Make save game Directory with user group permissions (config)
  install -d -m775 -g users ${pkgdir}/opt/${_pkgname}/Art/Save/
  install -m644 -g users ${srcdir}/BEEP/Art/Settings.xml ${pkgdir}/opt/${_pkgname}/Art/

  # Executable
  chmod 755 ${pkgdir}/opt/${_pkgname}/BEEP.bin32
}
