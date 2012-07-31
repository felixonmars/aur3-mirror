# Maintainer: SmiL3y <xakepa10@gmail.com>

pkgname=ccg-git
pkgver=20120731
pkgrel=3
pkgdesc='Utility to help you create conky configuration files using Conky-Colors as back-end'
arch=('any')
url='https://github.com/fluxer/CCG'
license=('GPL2')
makedepends=('git' 'gambas3-devel')
depends=('conky-colors-git' 'gambas3-gb-gtk' 'gambas3-gb-form'
         'gambas3-gb-form-stock' 'gambas3-gb-settings' 'gambas3-runtime')
source=('CCG.png' 'ccg.desktop')
md5sums=('7709ccf10f717120fe062f7e346c1b52'
         'a0d6cfb8c0fe546214237e875e33ccea')
_gitroot="git://github.com/fluxer/CCG.git"
_gitname="CCG"
  
build() {
  cd "$srcdir"
  if [ -d "${_gitname}" ];then
    msg2 "Updating local repo..."
    cd $_gitname
    git pull --depth=1 origin master
  else
    msg2 "Cloning remote repo..."
    git clone --depth=1 "${_gitroot}" "${_gitname}"
  fi

  msg2 "Compiling binary"
  cd "${srcdir}/${_gitname}"
  gbc3 -e -a -g -p -m .
  gba3 -o CCG.gambas
}

package() {
  install -D "${srcdir}/${_gitname}/CCG.gambas" "${pkgdir}/usr/bin/CCG"
  install -D "${srcdir}/CCG.png" "${pkgdir}/usr/share/pixmaps/CCG.png"
  install -D "${srcdir}/ccg.desktop" "${pkgdir}/usr/share/applications/ccg.desktop"
}
