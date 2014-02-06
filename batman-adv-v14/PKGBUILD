# Maintainer: RubenKelevra <cyrond@gmail.com>
pkgname=batman-adv-v14
pkgver=2013.4.0
pkgrel=2
pkgdesc="legacy batman kernel module (pinned to compatibility version 14)"
arch=('i686' 'x86_64')
url="http://www.open-mesh.net/"
license=('GPL')
install='batman-adv-v14.install'
source=("http://downloads.open-mesh.org/batman/releases/batman-adv-${pkgver}/batman-adv-${pkgver}.tar.gz"
        "batman-adv-v14.install")
depends=("linux")
provides=("batman-adv=2013.4.0")
conflicts=(
  "batman-adv"
  "batctl>2013.4.0"
)
makedepends=("linux-headers")
optdepends=("batctl-v14: management tool")

build() {
  cd "${srcdir}/batman-adv-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/batman-adv-${pkgver}"
  install -D -m644 batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('a9b1b7542c94cc6bf7c97b7b0d02bf071b5632a64480ae419358b9cb9cab6870'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37')
