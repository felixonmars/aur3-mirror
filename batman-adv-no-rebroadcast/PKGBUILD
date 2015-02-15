# Maintainer: Tobias Hachmer <tobias@hachmer.de>

pkgname=batman-adv-no-rebroadcast
pkgver=2014.4.0
pkgrel=1
pkgdesc='batman kernel module with no_rebroadcast patch'
arch=('i686' 'x86_64')
url='http://www.open-mesh.net/'
license=('GPL')
install='batman-adv.install'
source=("http://downloads.open-mesh.org/batman/releases/batman-adv-${pkgver}/batman-adv-${pkgver}.tar.gz"
        'batman-adv.install'
        'no_rebroadcast.patch')
depends=('linux')
makedepends=('linux-headers')

prepare() {
  cd "${srcdir}"/batman-adv-${pkgver}
  patch -Np1 -i "${srcdir}/no_rebroadcast.patch"
}

build() {
  cd "${srcdir}/batman-adv-${pkgver}"
  make KERNELPATH=/usr/lib/modules/$(uname -r)/build
}

package() {
  cd "${srcdir}/batman-adv-${pkgver}"
  install -D -m644 batman-adv.ko "${pkgdir}/usr/lib/modules/$(uname -r)/updates/net/batman-adv/batman_adv.ko"
  install -D -m644 README "${pkgdir}/usr/share/doc/batman-adv/README"
}

sha256sums=('757b9ddd346680f6fd87dc28fde6da0ddc0423a65fbc88fdbaa7b247fed2c1a8'
            '347599c02426a905690002885c277f91b82da2b29d3372348e5f02d03c435c37'
            '440eb252da197da01a28cfb43302bc5a43f3a4a6f955808a6bf21e117ad2c970')
