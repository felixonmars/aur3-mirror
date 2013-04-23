# Maintainer:   Lucky <archlinux@builds.lucky.li>

pkgname=vzquota-git
#_pkgname="${pkgname%-*}"
_pkgname=vzquota
pkgver=3.1
pkgrel=1
pkgdesc="OpenVZ disk quota control utility"
url="http://wiki.openvz.org/Download/${_pkgname}"
license=("GPL")
arch=("i686" "x86_64")
makedepends=("git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://git.openvz.org/pub/${_pkgname}")
md5sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed "s|^${_pkgname}-||g;s|-|.|g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" \
    SBINDIR="/usr/bin" \
    MANDIR="/usr/share/man" \
    install
}
