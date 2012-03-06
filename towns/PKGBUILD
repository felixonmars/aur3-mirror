# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=towns
pkgver=0.42
pkgrel=1
pkgdesc="A city building and management game mixed with an RPG that draws inspiration from titles spanning Dungeon Keeper, Dwarf Fortress and Majesty."
url="http://www.townsgame.com/"
license=('custom: "commercial"')
arch=('i686' 'x86_64')

depends=(java-runtime)
options=(!strip)
source=("towns.desktop" "towns")

md5sums=('705646c6f3ac9a53bbccfc764270a9be'
         '6296dfb97ed76012e67bbd17fa914f0f')

_gamepkg="Towns_${pkgver}_Linux.tar.gz"

build() {
   cd "${srcdir}"
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: $(readlink -f `pwd`/..)"
   if [[ -f "../${_gamepkg}" ]]; then
       msg "Found game package, installing..."
	   ln -fs "../${_gamepkg}" .
   else
	   error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ -f "${pkgpath}/${_gamepkg}" ]]; then
           msg "Found game package, installing..."
		   ln -fs "${pkgpath}/${_gamepkg}" .
	   else
		   error "Unable to find game package."
		   return 1
       fi
   fi
   tar -xzvf ${_gamepkg}
}

package(){
  cd "${srcdir}"
  
  # create Launcher
  install -d "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/towns" "${pkgdir}/usr/bin/towns"
  # Install Desktop File and Icon
  install -D -m644 "${srcdir}/towns.desktop" \
        "${pkgdir}/usr/share/applications/towns.desktop"
  install -D -m644 "${srcdir}/Towns/data/graphics/icon.png" \
		"${pkgdir}/usr/share/icons/towns.png"
        
  mkdir -p "${pkgdir}"/opt/towns
  cp "${srcdir}"/Towns/* "${pkgdir}"/opt/towns -R
  
  chown root.games "${pkgdir}"/opt/towns -R
  chmod 775 "${pkgdir}"/opt/towns -R
}
