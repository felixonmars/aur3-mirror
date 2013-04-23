# Maintainer:   Lucky <archlinux@builds.lucky.li>
# Contributor:  Jonny Gerold <fsk141@gmail.com>

pkgname=vzquota
pkgver=3.1
pkgrel=2
pkgdesc="OpenVZ disk quota control utility"
url="http://wiki.openvz.org/Download/${pkgname}/${pkgver}"
license=("GPL")
arch=("i686" "x86_64")
source=("http://download.openvz.org/utils/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=("a3c837999a90381ba028ee73e84f40f2")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" \
    SBINDIR="/usr/bin" \
    MANDIR="/usr/share/man" \
    install
}
