# Maintainer: Wido <widowild at myopera dot com>

pkgname=cardinalquest
_pkgname=cardinal-quest
pkgver=1.1c
pkgrel=1
pkgdesc="Hack and slash your way through a randomly generated dungeon:  a new adventure awaits every time!"
url="http://www.gameolith.com/game/cardinal-quest/"
license=('custom: "commercial"')
arch=('any')
makedepends=()
options=(!strip)
source=(${pkgname}.sh ${pkgname}.desktop icon128.png)
md5sums=('4a4ff1d0b663dded78b688df46bbb788'
         'daf38bcaaa06ee4787cc1409c4484697'
         'e9d15c8af154b1e272972475f7bfbb89')

_gamepkg="${_pkgname}_${pkgver}_all.air"

depends=('adobe-air')

build() {
   cd ${srcdir}
   msg "You need a full copy of this game in order to install it"
   msg "Searching for ${_gamepkg} in dir: \"$startdir\""
   pkgpath=$startdir
   if [[ ! -f "$startdir/${_gamepkg}" ]] ; then
       error "Game package not found, please type absolute path to ${_gamepkg} (/home/joe):"
       read pkgpath
       if [[ ! -f "${pkgpath}/${_gamepkg}" ]] ; then
           error "Unable to find game package." && return 1
       fi
   fi
    msg "Found game package, installing..."

    if [[ -f ${pkgpath}/${_gamepkg} ]] ; then
        ln -fs ${pkgpath}/${_gamepkg} . || return 1
        install -Dm644 ${srcdir}/${_gamepkg}  ${pkgdir}/opt/${pkgname}/${pkgname}.air

    fi

        # Install Launcher
        install -m755 -D ${srcdir}/${pkgname}.sh \
            ${startdir}/pkg/usr/bin/${pkgname}

        # Install Desktop
        install -m644 -D ${srcdir}/icon128.png \
            ${startdir}/pkg/usr/share/pixmaps/${pkgname}.png

        install -m644 -D ${srcdir}/${pkgname}.desktop \
            ${startdir}/pkg/usr/share/applications/${pkgname}.desktop
}
