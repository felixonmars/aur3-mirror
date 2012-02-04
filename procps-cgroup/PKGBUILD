# $Id: PKGBUILD 39239 2009-05-14 06:04:46Z eric $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
### Local changes: Vladimir Lomov <lomov.vl@gmail.com>
### Add support for cgroup. The used patches based on ones taken from Fedora (rawhide, source).

pkgname=procps-cgroup
_pkgname=procps
pkgver=3.2.8
pkgrel=1
pkgdesc="Utilities for monitoring your system and processes on your system with cgroup support"
arch=('i686' 'x86_64')
url="http://procps.sourceforge.net/"
license=('GPL' 'LGPL')
groups=('base')
depends=('ncurses')
provides=('procps')
conflicts=('procps')
backup=('etc/sysctl.conf')
source=(http://procps.sourceforge.net/procps-${pkgver}.tar.gz sysctl.conf procps-output-cgroup.patch procps-man-cgroup.patch)
md5sums=('9532714b6846013ca9898984ba4cd7e0' '9be3a131a7068aae11418e6dd99e2221' '2d75c8d5c90dcb0ff80b26bfce52a231' '8ac2b36594ded5b1f1b71244a28facb5')
sha1sums=('a0c86790569dec26b5d9037e8868ca907acc9829' '9b9a314010d042b5aa487893c06f361531525e6a' '661affcdb0925f3040b5fc6eca7c46803721f321' '740abd22c10683bb47759cc3d813d384b69d1cb4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  sed -i "s:\$(lib64):lib:" Makefile || return 1
  patch -p0 < ../procps-output-cgroup.patch || return 1
  patch -p0 < ../procps-man-cgroup.patch || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" ldconfig=/bin/true install || return 1
  install -D -m644 "${srcdir}/sysctl.conf" "${pkgdir}/etc/sysctl.conf" || return 1
  install -d "${pkgdir}/usr/include/proc" || return 1
  install -m644 proc/*.h "${pkgdir}/usr/include/proc" || return 1
}
# vim: tw=80 ts=2 sw=2 et:
