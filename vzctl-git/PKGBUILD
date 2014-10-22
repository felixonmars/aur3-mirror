# Maintainer:   Lucky <archlinux@builds.lucky.li>

pkgname=vzctl-git
_pkgname="${pkgname%-*}"
pkgver=4.8.3.gd9c3a14
pkgrel=1
pkgdesc="OpenVZ containers control utility"
url="http://wiki.openvz.org/Download/vzctl"
license=("GPL")
arch=("i686" "x86_64")
depends=("iproute" "libcgroup>=0.37" "libxml2" "openssh" "ploop" "rsync")
makedepends=("git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git://git.openvz.org/pub/${_pkgname}"
        "openvz")
md5sums=("SKIP"
         "54c08e9b0e41fb9f0a47df721e3af5fa")

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
