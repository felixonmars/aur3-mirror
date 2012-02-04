# Contributor: shura <shura1991@gmail.com>
pkgname="fusd-kor-svn"
pkgver=9999
pkgrel=1
pkgdesc="Linux framework for proxying device file callbacks into user-space."
arch=(i686 x86_64)
url="http://www.circlemud.org/%7Ejelson/software/fusd/"
license=('BSD (GPL-compatible)')
groups=()
depends=('kernel26-headers')
makedepends=('svn' 'gcc')
optdepends=()
provides=('fusd-kor')
conflicts=()
replaces=('fusd-kor')
backup=()
options=()
install=fusd-kor.install
source=('fusd-kor-2.6.33-kernel.patch')
noextract=()
md5sums=('769fda3fbfa9a0227335963c59d66589')

_svntrunk="http://svn.xiph.org/trunk/fusd/"
_svnmod="fusd-kor"

build() {
  cd "${srcdir}"
  
  msg "Starting SVN checkout..."
  if [ -d "${_svnmod}/.svn" ]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r ${pkgver} "${_svnmod}"
  fi
  msg "SVN checkout done or server timeout"

  if [[ -e "${srcdir}/${_svnmod}-build" ]]; then
    rm -Rf "${srcdir}/${_svnmod}-build"
  fi

  cp -R "${_svnmod}" "${_svnmod}-build"
  cd "${srcdir}/${_svnmod}-build"

  msg "Patching sources..."
  patch -p1 < "${srcdir}/fusd-kor-2.6.33-kernel.patch"
  msg "Starting make..."
  make || return 1
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/include"
  mkdir -p "${pkgdir}/lib"
  mkdir -p "${pkgdir}/lib/modules"
  mkdir -p "${pkgdir}/lib/modules/$(uname -r)"
  mkdir -p "${pkgdir}/lib/modules/$(uname -r)/kernel"
  mkdir -p "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers"
  mkdir -p "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/misc"
  install -d -m 0755 "${pkgdir}/usr/lib"
  install -m 0755 "libfusd/libfusd.a" "libfusd/libfusd.so.0.0" "${pkgdir}/usr/lib"
  install -d -m 0755 "${pkgdir}/usr/include"
  install -m 0755 "include/fusd.h" "include/fusd_msg.h" "include/kfusd.h" "${pkgdir}/usr/include"
  install -d -m 0755 "${pkgdir}/lib/modules/2.6.33-ARCH/kernel/drivers/misc"
  install -m 0755 "kfusd/kfusd.ko" "${pkgdir}/lib/modules/2.6.33-ARCH/kernel/drivers/misc"

  msg "Cleaning..."
  rm -R "${srcdir}/${_svnmod}-build"
}

# vim:set ts=2 sw=2 et:
