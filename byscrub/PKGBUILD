# Maintainer: eayin2 <eayin2 at gmail dot com>
pkgname="byscrub"
pkgver="0.1.0"
pkgrel=1
url="https://github.com/eayin2/byscrub"
pkgdesc="btrfs scrubs all mounted btrfs. Logs and sends email if error found."
arch=('x86_64' 'armv7h')
license=('GPL')
depends=("python3" "gymail")
makedepends=('git')
source=("${pkgname}-${pkgver}"::'git://github.com/eayin2/byscrub.git')
md5sums=('SKIP')
install='byscrub.install'

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 byscrub.py "${pkgdir}"/usr/bin/byscrub
}
