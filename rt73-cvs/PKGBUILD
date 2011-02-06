# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>
pkgname=rt73-cvs
pkgver=20080213
pkgrel=1
_kernver=$(uname -r)
pkgdesc="A kernel module with support for RT73 (RT2571W) based wireless cards"
arch=('i686' 'x86_64')
url="http://rt2x00.serialmonkey.com/"
license=('GPL')
depends=('kernel26' 'rt2x00-rt71w-fw')
makedepends=('cvs')
provides=('rt73')
conflicts=('rt73')

install=rt73.install
source=()
md5sums=()

_cvsmod="source/rt73/Module"
_cvsroot=":pserver:anonymous:@rt2400.cvs.sourceforge.net:/cvsroot/rt2400"

build() {
  cd ${startdir}/src
  msg "Connecting to rt2400.sourceforge.net CVS server..."
  cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod}
  cd ${_cvsmod}
  
  msg "Starting build process..."
  make KERNDIR=/lib/modules/${_kernver}/build || return 1
  install -D -m644 rt73.ko ${startdir}/pkg/lib/modules/${_kernver}/kernel/drivers/net/wireless/rt73.ko || return 1
}
