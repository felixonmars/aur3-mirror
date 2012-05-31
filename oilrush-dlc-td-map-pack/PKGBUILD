# Maintainer: feuri <feurisoft [at] gmail [dot] com>

pkgname=oilrush-dlc-td-map-pack
pkgver=latest
pkgrel=1
pkgdesc="a tower defense map pack for oilrush"
arch=('any')
depends=('oilrush')
options=(!strip)
license=("commercial")
url="http://oilrush-game.com/"
_dlcpkg="oilrush_dlc_td_map_pack.ung"

build() {
  cd ${srcdir}

  msg "You need a full copy of this DLC in order to install it"
  msg "Searching for \"${_dlcpkg}\" in dir: $(readlink -f ${startdir})"
  pkgpath=${startdir}

  if [[ ! ( -f "${startdir}/${_dlcpkg}" ) ]]; then
    error "DLC package not found, please type absolute path to game setup package (/home/joe):"
    read pkgpath
    if [[ ! ( -f "${pkgpath}/${_dlcpkg}" ) ]] ; then
       error "Unable to find DLC package." && return 1
   fi
  fi
  msg "Found DLC package, installing..."

  cp "${pkgpath}/${_dlcpkg}" .
}

package() {
  cd "${srcdir}"
  install -d -m755 "${pkgdir}/opt/oilrush/data/"
  install -m644 "${_dlcpkg}" "${pkgdir}/opt/oilrush/data/"
}

# vim:set ts=2 sw=2 et:
