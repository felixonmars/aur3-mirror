# Maintainer: eayin2 <eayin2 at gmail dot com>
pkgname="trashcaron"
pkgver="0.1.1"
pkgrel=1
url="https://github.com/eayin2/trashcaron"
pkgdesc="Trashbin script with btrfs support and automatic trash purge feature."
arch=('x86_64' 'armv7h')
license=('GPL')
depends=("python3")
makedepends=('git')
source=("${pkgname}-${pkgver}"::'git://github.com/eayin2/trashcaron.git')
md5sums=('SKIP')
install='trashcaron.install'

pkgver() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 trashcaron.py "${pkgdir}"/usr/bin/trashcaron
}
