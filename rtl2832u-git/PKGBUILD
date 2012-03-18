# Maintainer: Mauro Santos <registo.mailling@gmail.com>
# Contributor: Leif Warner <abimelech@gmail.com>
# Contributor: Christophe Gueret <christophe.gueret@gmail.com>
pkgname=rtl2832u-git
pkgver=20120318
_extramodules="extramodules-$(uname -r | cut -f-2 -d.)-ARCH"
_kernver="$(cat /lib/modules/${_extramodules}/version)"
pkgrel=1
pkgdesc="Linux module for the RTL2832U DVB-T USB2.0 device"
arch=('i686' 'x86_64')
url="https://github.com/ambrosa/DVB-Realtek-RTL2832U-2.2.2-10tuner-mod_kernel-3.0.0"
license=('GPL')
depends=('linux')
makedepends=('git' 'linux-headers')
install="${pkgname}.install"
provides=('rtl2832u')
conflicts=('rtl2832u')
source=('makefile.patch')
md5sums=('a7cfdee7fe8f8e5cfd28a28d379c3de0')

_gitroot="git://github.com/ambrosa/DVB-Realtek-RTL2832U-2.2.2-10tuner-mod_kernel-3.0.0.git"
_gitname="rtl2832"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  
  cd "${srcdir}/${_gitname}-build/RTL2832-2.2.2_kernel-3.0.0"
  patch -p1 < "$srcdir/makefile.patch"
  export KBUILD_SRC="/usr/src/linux-${_kernver}"
  make
}

package() {
  install -D -m644 "${srcdir}/${_gitname}-build/RTL2832-2.2.2_kernel-3.0.0/dvb-usb-rtl2832u.ko" "${pkgdir}/lib/modules/${_extramodules}/dvb-usb-rtl2832u.ko"
  sed -i -e "s/EXTRAMODULES='.*'/EXTRAMODULES='${_extramodules}'/" "${startdir}/${install}"
} 
