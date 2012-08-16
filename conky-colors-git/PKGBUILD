# Maintainer: SmiL3y <xakepa10@gmail.com>

pkgname=conky-colors-git
pkgver=20120813
pkgrel=1
pkgdesc="An easier way to configure Conky"
arch=('i686' 'x86_64')
url="https://github.com/helmuthdu/conky_colors"
license=('GPL')
makedepends=('perl' 'git')
depends=('pystatgrab' 'ttf-liberation' 'hddtemp' 'curl' 'lm_sensors' 'ttf-ubuntu-font-family')
optdepends=('conky: standard conky'
            'conky-lua: conky with Lua support'
            'conky-nvidia: conky with nVidia support'
            'conky-lua-nv: conky with Lua and nVidia support'
            'conky-nolan: conky without wireless support')
conflicts=('ttf-openlogos' 'conky-colors')
replaces=('conky-colors')
options="!strip"
install="${pkgname}.install"
_gitroot="git://github.com/helmuthdu/conky_colors.git"
_gitname="conky-colors"
source=()

build() {
  if [ -d "${_gitname}" ] ; then
    cd "${srcdir}/${_gitname}"
    msg2 "Updating local tree..."
    git pull --depth=1 origin master
  else
    cd "${srcdir}"
    msg2 "Cloning initial copy of ${_gitname}..."
    git clone --depth=1 "${_gitroot}" "${_gitname}"
    cd "${srcdir}/${_gitname}"
  fi
  
  msg2 "Preparing for build..."
  rm -rf "${srcdir}/${_gitname}-build"
  cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  
  msg2 "Starting make..."
  cd "${srcdir}/${_gitname}-build"
  make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	make DESTDIR="${pkgdir}/" install
}
