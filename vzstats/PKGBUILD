# Maintainer:   Lucky <archlinux@builds.lucky.li>

pkgname=vzstats
pkgver=0.5.3
pkgrel=1
pkgdesc="OpenVZ stats collection daemon"
url="http://wiki.openvz.org/Download/vzstats/${pkgver}"
license=("GPL")
arch=("any")
source=("http://download.openvz.org/utils/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=("53848e367878f167d25bee85ace39b7f")
sha1sums=("5fdaa55aa84646764a2bcfacb6f29a704616c938")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" \
    SBINDIR="/usr/bin" \
    install #install-cronjob
}
