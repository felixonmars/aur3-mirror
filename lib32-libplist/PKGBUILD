# AUR packages should not be built from binaries. This is a workaround.
# If you manage to build this lib32 package from source, let the maintainer
# know and you will be helping the AUR community.

_pkgbase=libplist
pkgname=lib32-${_pkgbase}
pkgver=1.10
pkgrel32=1
pkgrel=1
pkgdesc="A library to handle Apple Property List format whereas it's binary or XML (32 bit)"
arch=('x86_64')
url="http://libimobiledevice.org/"
#depends=('lib32-openssl' ) # 'usbmuxd' 'gnutls' 'libgcrypt'
depends=('lib32-glib2' 'lib32-libxml2' "${_pkgbase}=${pkgver}") #'python2'
license=('GPL2' 'LGPL2.1')
source=("ftp://ftp.archlinux.org/extra/os/i686/${_pkgbase}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz")
md5sums=('5717711232861b4981aeb3d11b807af7')

package() {
  mkdir -p "${pkgdir}"/usr/lib32
  cp -rPf "${srcdir}"/usr/lib/* "${pkgdir}"/usr/lib32
  sed -i "s#/usr/lib#/usr/lib32#" "${pkgdir}"/usr/lib32/pkgconfig/*.pc
}



