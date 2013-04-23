# Maintainer:   Lucky <archlinux@builds.lucky.li>

pkgname=vzctl-stable-git
_pkgname="${pkgname%-*-*}"
pkgver=4.1.2
_pkgver="4.1"
pkgrel=1
pkgdesc="OpenVZ containers control utility"
url="http://wiki.openvz.org/Download/vzctl"
license=("GPL")
arch=("i686" "x86_64")
depends=("iproute" "rsync" "openssh" "ploop" "libcgroup>=0.37")
makedepends=("git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://git.openvz.org/pub/${_pkgname}#branch=${_pkgver}-${pkgname:6:6}"
        "openvz")
md5sums=("SKIP"
         "e997b5b1c241c7d8c779d7d93863c2d7")

pkgver() {
  cd "${_pkgname}"
  git describe --always | sed "s|^${_pkgname}-||g;s|-|.|g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib --enable-bashcomp --enable-logrotate --disable-static
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "${srcdir}/openvz" "${pkgdir}/etc/rc.d/openvz"
  make DESTDIR="${pkgdir}" \
    sbindir="/usr/bin" \
    bindir="/usr/bin" \
    install
}
