# AUR packages should not be built from binaries. This is a
# workaround. If you manage to build this lib32 package from
# source, let the maintainer know and you will be helping the
# Arch community.

_pkgbase=libwbclient
pkgname=lib32-${_pkgbase}-updated
pkgver=4.1.7
pkgrel32=1
pkgrel=2
pkgdesc="Samba winbind client library (32 bits)"
arch=('x86_64')
url="http://www.samba.org"
license=('GPL3')
conflicts=('lib32-libwbclient')
provides=('lib32-libwbclient')
depends=('lib32-libbsd' "${_pkgbase}>=${pkgver}")
source=("http://mirror.yandex.ru/archlinux/extra/os/i686/${_pkgbase}-${pkgver}-${pkgrel32}-i686.pkg.tar.xz")
md5sums=('45010f4d82bc5755af265439e2803b24')

package() {
  mkdir -p "${pkgdir}"/usr/lib32
  cp -rPf "${srcdir}"/usr/lib/* "${pkgdir}"/usr/lib32
  sed -i 's#/usr/lib#&32#' "${pkgdir}"/usr/lib32/pkgconfig/wbclient.pc
}

