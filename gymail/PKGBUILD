# Maintainer: eayin2 <eayin2 at gmail dot com>
pkgname="gymail"
pkgver="0.1"
pkgrel=1
url="https://github.com/eayin2/gymail"
pkgdesc="Simple python mail notification script"
arch=('x86_64')
license=('GPL')
depends=("python3")
makedepends=('git')
source=("${pkgname}-${pkgver}"::'git://github.com/eayin2/gymail.git')
md5sums=('SKIP')
install='gymail.install'

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 gymail.py "${pkgdir}"/usr/bin/gymail.py
}
