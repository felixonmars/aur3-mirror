# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Yang Bai <hamo.by@gmail.com>
pkgname=novm-git
_srcname=novm
pkgver=20150203
pkgrel=1
epoch=
pkgdesc="novm is a legacy-free, type 2 hypervisor written in Go. Its goal is to provide an alternate, high-performance Linux hypervisor for cloud workloads."
arch=('i686' 'x86_64')
url="https://github.com/google/novm"
license=('Apache')
groups=()
depends=('dnsmasq' 'bridge-utils' 'fakeroot' 'python' 'python-six')
makedepends=('go' 'make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/google/novm.git")
noextract=()
md5sums=(SKIP)

prepare() {
  echo "SKIP"
}

build() {
  cd $_srcname

  make
}

check() {
  echo "SKIP"
}

package() {
  cd $_srcname

  cp -r dist/* "${pkgdir}/"
}

# vim:set ts=2 sw=2 et:
