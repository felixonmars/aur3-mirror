# Maintainer: Mike Shutlar (iFSS) <mike at epinux(dot)co(dot)uk>
pkgname=super-office-stress
_gamepkg=super_office_stress.zip
pkgver=1.1
pkgrel=1
pkgdesc="Roguelike set in an office building. Go on a quest for Mythril Copier!"
url="http://www.indiebuskers.net/"
arch=('x86_64' 'i686')
license=('unknown')
depends=('allegro4' 'soil')
optdepends=('timidity++: sound support')
install="super-office-stress.install"
source=("super-office-stress.desktop" "super-office-stress.sh")
options=(!strip)

sha512sums=('096ec3d04baea4ad9132eda272bf5c7cbc38fbfc534e641c558a85ce1fc9699b8ea9bcf398e7f0b7544dae8e65d082e89aee9a9495bdd8a28d355716f60dfe6a'
            '570765f73379269c76912bb82b88ee97c6150ad6c04cea8c3fd8fecc5ac0044a44f1adf2caebf1fab2b8dd6118624e351b3676c5f51bcd14a06fd169dbfd23ad')
sha384sums=('1930d32897f0b444c1c88225fdac851fc0de53dce7380408c38e19802f1c6489fb717bb8944a5744db7b8a557ed98488'
            '0c4af673252f5e0a860cc1975c4aed6458255886440550cf676059e4b4ede7747ce1b1b5b298a142d8eba9ed40385a8f')
sha256sums=('f321cb40d1245161a4f54d3d11d17833d3e1903bc6672e0d563bd11c607c7e8e'
            '8f3ef9eb0f100d3b929c2b212cf8fff5551aa695056a4441cfc21ef7874812a2')
md5sums=('96149b79dd135bc92f0b71f1b79aabbc'
         '781ce7f33eb8473a404d1a1c4d75fd70')

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
  unzip "${pkgpath}/${_gamepkg}" || return 1

  cd "${srcdir}/super_office_stress"
  sed -i "s/office/super_office_stress/" "Makefile" # correct source file name
  sed -i "s/-lagl -lSOIL/-lalleggl -lSOIL -lX11 -lXext -lXxf86vm -ldl -lXcursor -lXpm/" "Makefile" # correct libraries
  sed -i "s/<SOIL\/SOIL.h>/<SOIL.h>/" "super_office_stress.c" # correct header path
  
  rm alleg42.dll super_office_stress.exe
  
  make
  
  cd "${srcdir}"
  
  install -d "${pkgdir}/usr/share/games/"
  cp -r "${srcdir}/super_office_stress/" "${pkgdir}/usr/share/games/"
  mv "${pkgdir}/usr/share/games/super_office_stress" "${pkgdir}/usr/share/games/super-office-stress"
  chmod 0755 "${pkgdir}/usr/share/games/${pkgname}/super_office_stress"
  install -D -m755 super-office-stress.sh "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 super-office-stress.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
  
# vim:set ts=2 sw=2