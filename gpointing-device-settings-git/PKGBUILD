# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=gpointing-device-settings-git
pkgver=20120121
pkgrel=1
pkgdesc=""
arch=('i686' 'x86_64')
url="http://live.gnome.org/GPointingDeviceSettings"
license=('GPL')
depends=('desktop-file-utils' 'gconf' 'gnome-settings-daemon' 'gtk2' 'xorg-xinput')
makedepends=('git' 'intltool')
provides=('gpointing-device-settings')
conflicts=('gpointing-device-settings')
install=${pkgname}.install
source=('fixes.patch')
sha512sums=('af4d86a8a8936aa1ccb427bd23df26ead7d8bf63982ad65272f3ac3987faa7793241e864181be5c53669ffa5e4d4befa1fcac93e9fcf55b0295c59914768f2ca')

_gitroot='git://git.gnome.org/gpointing-device-settings'
_gitname='gpointing-device-settings'

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  # Apply fixes (based on Fedora patches)
  patch -Np1 -i "${srcdir}/fixes.patch"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  #MAKEFLAGS="-j1"
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}/" install

  install -dm755 "${pkgdir}/usr/share/gconf/schemas/"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname%-*}.schemas" --domain ${pkgname%-*} "${pkgdir}"/etc/gconf/schemas/*.schemas

  rm -f "${pkgdir}"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
