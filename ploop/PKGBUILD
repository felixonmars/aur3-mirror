# Maintainer:   Lucky <archlinux@builds.lucky.li>

pkgname=ploop
pkgver=1.12
pkgrel=1
pkgdesc="OpenVZ containers in a file user-space library and tools"
url="http://wiki.openvz.org/Download/ploop/${pkgver}"
license=("GPL")
arch=("i686" "x86_64")
depends=("libxml2")
source=("http://download.openvz.org/utils/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2")
md5sums=("326ea970f4e5a9e45040b8182c8eef29")
sha1sums=("486b6d011ad1f0f93ddfdd6fc6c538bb3c905540")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" \
    SBINDIR="/usr/bin" \
    USRSBINDIR="/usr/bin" \
    LIBDIR="/usr/lib" \
    install
}
