# Maintainer: Boudhayan Gupta <me@BaloneyGeek.com>

_pkgname=spl
pkgname=${_pkgname}-tools
_pkgmaj=0.6.0
_pkgmin=rc14
pkgver=${_pkgmaj}_${_pkgmin}
_pkgver=${_pkgmaj}-${_pkgmin}
pkgrel=1
pkgdesc="OpenSolaris primitives emulation for the Linux kernel (Usermode tools)"

url="http://zfsonlinux.org"
arch=("x86_64" "i686")
license=("CDDL")
depends=("spl-modules-dkms")
optdepends=()
makedepends=()
conflicts=()
provides=()
backup=()

source=("http://archive.zfsonlinux.org/downloads/zfsonlinux/spl/${_pkgname}-${_pkgver}.tar.gz")
md5sums=("07b6cf56659a95bc22ac45dbdd8344a0")

build() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --sbindir=/usr/sbin \
              --with-config=user
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  make DESTDIR=${pkgdir} install
}
