# Maintainer: eayin2 <eayin2 at gmail dot com>
pkgname="bytterfs"
pkgver="0.1"
pkgrel=1
pkgdesc="Backup script for btrfs send/receive"
url="https://github.com/eayin2/bytterfs"
arch=('x86_64')
license=('GPL')
depends=("btrfs-progs" "python3" "gymail")
makedepends=('git')
source=("${pkgname}-${pkgver}"::'git://github.com/eayin2/bytterfs.git')
md5sums=('SKIP')
install='bytterfs.install'

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bytterfs.py "${pkgdir}"/usr/bin/bytterfs.py
}
