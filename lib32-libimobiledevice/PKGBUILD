# AUR packages should not be built from binaries. This is a workaround.
# If you manage to built this lib32 package from source, let the maintainer know
# and you will be helping the AUR community.

_pkgbase=libimobiledevice
pkgname=lib32-${_pkgbase}
pkgver=1.1.5
pkgrel32=1
pkgrel=1
pkgdesc="Is a software library that talks the protocols to support iPhone and iPod Touch devices on Linux (32 bit)"
arch=('x86_64')
url="http://libimobiledevice.org/"
depends=('lib32-openssl' "${_pkgbase}=${pkgver}") # 'usbmuxd' 'gnutls' 'libgcrypt'
license=('GPL2' 'LGPL2.1')
source=("ftp://ftp.archlinux.org/extra/os/i686/${_pkgbase}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz")
md5sums=('66d62e8dcf277d55490a11257d97a2e4')

package() {
  mkdir -p "${pkgdir}"/usr/lib32
  cp -rPf "${srcdir}"/usr/lib/* "${pkgdir}"/usr/lib32
  sed -i "/libdir=/s/lib$/lib32/" "${pkgdir}"/usr/lib32/pkgconfig/*.pc
}



