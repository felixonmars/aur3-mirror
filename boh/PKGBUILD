# Maintainer: Wido <widomaker2k7 at gmail dot com>
pkgname=boh
pkgver=20101208
_build=1906
pkgrel=2
pkgdesc="A world of claustrophobic, mysterious, puzzle-riddled, dangerous mazes where, surrounded by countless enemies, (requires copy of the full game)"
url="http://www.gameolith.com/game/boh/"
license=('custom: "commercial"')
arch=('i686' 'x86_64')
makedepends=()
source=("boh.sh")
md5sums=('3e5d79c3442c2eb5e75e5582bab49cbc')

_gamepkg="${pkgname}_${pkgver}.${_build}_i386.deb"

depends=('libglade' 'mesa' 'sdl_net')
_depends64=('lib32-libglade' 'lib32-mesa' 'lib32-sdl_net')

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
    #tar xvf ${pkgpath}/${_gamepkg} || return 1

  ar x ${pkgname}_${pkgver}.${_build}_i386.deb
  tar -zxf data.tar.gz
  mkdir -p ${pkgdir}/
  cp -r ${srcdir}/opt ${pkgdir}/
  cp -r ${srcdir}/usr ${pkgdir}/
}

package(){
  cd ${srcdir}
  install -Dm 755 ${srcdir}/boh.sh ${pkgdir}/usr/bin/boh

  # Install license
  install -D -m644 ${srcdir}/opt/BOH/licenses/README ${pkgdir}/usr/share/licenses/${pkgname}/readme.txt

  # Make save game Directory with user group permissions (config)
  install -d -m775 -g users ${pkgdir}/opt/BOH/

}
