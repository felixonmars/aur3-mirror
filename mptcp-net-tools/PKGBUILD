# Maintainer: Jon Gjengset <jon@tsp.io>

pkgname=mptcp-net-tools
pkgver=0.87.4c68c31
pkgrel=1
pkgdesc="MPTCP enabled configuration tools for Linux networking"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/multipath-tcp/net-tools"
conflicts=('net-tools')
provides=('net-tools=1.6.0')
depends=('glibc')
makedepends=('git')
# use git snapshot currently prefered over release
source=("net-tools::git://github.com/multipath-tcp/net-tools.git#branch=mptcp_v0.87")
options=(!makeflags)
sha1sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname#mptcp-}
  echo 0.87.$(git rev-parse --short HEAD)
}

prepare() {
  sed -i "s#/sbin#/bin#" ${srcdir}/${pkgname#mptcp-}/Makefile
  sed -i "s#/usr##" ${srcdir}/${pkgname#mptcp-}/man/Makefile
}

build() {
  cd ${srcdir}/${pkgname#mptcp-}
  yes "" | make
}

package() {
  cd ${srcdir}/${pkgname#mptcp-}
  make DESTDIR=${pkgdir}/usr update

  rm "${pkgdir}"/usr/share/man/man1/{nis,yp}domainname.1
  rm -rf "${pkgdir}"/usr/share/man/man1
}
