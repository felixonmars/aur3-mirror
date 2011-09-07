# Maintainer: Wido <widomaker2k7 [at] gmail [dot] com>

pkgname=rimshot
pkgver=1
pkgrel=2
pkgdesc="Rimshot was designed from ground up with a simple and intuitive interface in mind to allow the creation of any kinds of drumbeats."
arch=('any')
url="http://stabyourself.net/rimshot/"
license=('MIT')
depends=('love')
makedepends=('unzip')
source=(${pkgname}.sh ${pkgname}.desktop)
_gamepkg="${pkgname}-linux.zip"

md5sums=('8d11bcdc59af2a0c07f429b36c72c248'
         '629fddc533c6c5f33532a4e289271206')

build(){
  cd $srcdir
  msg "You need a full copy of this game in order to install it"
  msg "Searching for \"${_gamepkg}\" in dir: $(readlink -f `pwd`/..)"
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
  unzip ${srcdir}/${_gamepkg} -d  $srcdir/${pkgname} || return 1

}
package() {
    cd $srcdir

    # Install Data
    install -D -m755 "${srcdir}/${pkgname}/Rimshot.love" "${pkgdir}/usr/share/games/${pkgname}/${pkgname}.love"
    install -D -m644 "${srcdir}/${pkgname}/Readshot.txt" "$pkgdir/usr/share/games/${pkgname}/readme"

    # Install Launcher
    install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Install Desktop
    install -D -m644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

}
# vim:set ts=2 sw=2 et:
