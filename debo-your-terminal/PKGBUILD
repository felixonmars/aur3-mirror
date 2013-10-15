# $Id$
# Contributor: Carmelo Pellegrino <cazzatedimelo@gmail.com>
pkgname=debo-your-terminal
pkgver=1
pkgrel=4
pkgdesc="An attempt to make your terminal more Deboshing."
arch=(any)
license=('none')
url="http://none.org"
depends=('fortune-mod' 'cowsay')
makedepends=('wget')
provides=()
replaces=()
conflicts=()

__repo='http://dl.dropboxusercontent.com/u/4049325/'

build() {
  cd "${srcdir}/"
  msg "Downloading needed Deboshing stuff..."

  wget ${__repo}/debo.cow -O debo.cow
  wget ${__repo}/debo -O debo
  echo -e "#!/bin/bash\nfortune debo | cowsay -f debo">debo-my-terminal
  chmod +x debo-my-terminal
  msg "Dowloaded!"
  msg "Creating the Debo database!"
  strfile debo

}

package() {
  cd "${srcdir}"
  [ ! -d "${pkgdir}/usr/share/fortune/" ] && mkdir -p ${pkgdir}/usr/share/fortune/
  [ ! -d "${pkgdir}/usr/share/cows/" ] && mkdir -p ${pkgdir}/usr/share/cows/
  [ ! -d "${pkgdir}/usr/bin/" ] && mkdir -p ${pkgdir}/usr/bin/
  mv debo debo.dat ${pkgdir}/usr/share/fortune/
  mv debo.cow ${pkgdir}/usr/share/cows/
  mv debo-my-terminal ${pkgdir}/usr/bin/
}
