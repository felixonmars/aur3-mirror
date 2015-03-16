# Maintainer: Lucas Tanure <tanure@linux.com>

tool=gcc-linaro
targetEABI=arm-linux-gnueabihf
host=x86_64
_relver=4.9
_reldate=14.11
pkgrel=5
_relverdate=${_relver}-20${_reldate}
pkgname=${tool}-${targetEABI}
pkgver=${_relver}_${_reldate}
pkgdesc="Linux binaries for the ARMv7 Linux cross-toolchain (Compiled by Linaro)"
arch=('i686' 'x86_64')
url="https://wiki.linaro.org/WorkingGroups/ToolChain"
license=('GPL' 'LGPL')
depends=()
optdepends=('libtinfo: arm-linux-gnueabihf-gdb needs')
provides=(${pkgname})
options=(!strip staticlibs)
install=$pkgname.install
source=("http://releases.linaro.org/${_reldate}/components/toolchain/binaries/${targetEABI}/${tool}-${_relverdate}-${host}_${targetEABI}.tar.xz")
md5sums=('6cacdc0c896bae5d7c6f074e2e219db9')

package () {
	mkdir -p "$pkgdir/opt"
	mv "$srcdir/${tool}-${_relverdate}-${host}_${targetEABI}" "$pkgdir/opt/${pkgname}"
}
