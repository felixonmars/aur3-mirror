# Maintainer: Mike Shutlar (iFSS) <mike at epinux(dot)co(dot)uk>
pkgname=pakkumans-defense
_gamepkg=pd_linux.bz2
pkgver=1
pkgrel=1
pkgdesc="Pacman with tower defense elements. Eat dots and use them to build defenses against the ghosts."
url="http://www.indiebuskers.net/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('hicolor-icon-theme' 'gtk2' 'libxft' 'nss')
if [[ "${CARCH}" == "x86_64" ]]; then
  depends=('hicolor-icon-theme' 'lib32-gtk2' 'lib32-libxt' 'lib32-nss' 'lib32-curl' 'lib32-alsa-lib')
fi
source=("pakkumans-defense.desktop" "pakkumans-defense.sh")
options=(!strip)

sha512sums=('fd454268653b2fe56d3b45366d2da4ed9f6e11355d93e5f10c0764a32d06e12dd6e98394f8e28ff42f703ec15e07ce5341c369438757236ce29034ac3c61eb47'
            '71c53b17d199aa5385229bc6c026cdb1c79774c5853072829b172c0d0101dbced407f8441821e31719411a7484eb49af91f51816d5ef87ac554fd8287999078b')
sha256sums=('6d0cd2fa3821c090005d9d20053d988b1012712c0e93722e6fdf7c486501274b'
            '2fd37df5dded4ed9fbb7268fa9745681a38b77f284b684efddc5a340037c30eb')
md5sums=('c7500417e98dbe3f77f1caf96e2388e2'
         '7dd4dbb1f2dab3cf36a7a4b179de7ba1')

package() {
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

  ln -fs "${pkgpath}/${_gamepkg}" . || return 1
  bunzip2 -k "${pkgpath}/${_gamepkg}" || return 1

  cd "${srcdir}"
  install -D -m755 pakkumans-defense.sh "${pkgdir}/usr/bin/${pkgname}"
  install -d "${pkgdir}/usr/share/games/${pkgname}"
  install -D -m755 "${pkgpath}/pd_linux" "${pkgdir}/usr/share/games/${pkgname}/pd_linux"
  install -D -m644 pakkumans-defense.desktop "${pkgdir}/usr/share/applications/pakkumans-defense.desktop"
}
  
# vim:set ts=2 sw=2