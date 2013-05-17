# Maintainer: Patryk Kowalczyk <patryk at kowalczyk dot ws>
pkgname=virtio-solaris
pkgver=1.3
pkgrel=1
pkgdesc="virtio drivers for solaris 10"
arch=(i686 x86_64)
url="http://zaytsev.su/solaris-virtio/"
license=('GPL')
groups=()
depends=(qemu)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(http://zaytsev.su/solaris-virtio/packages/sol10/vioblk-1.3-itu.iso)
noextract=()

package() {
  install -Dm 644 vioblk-${pkgver}-itu.iso\
    "$pkgdir/usr/share/virtio/vioblk-sol.iso"
}
md5sums=('746617dc4373e8f6e9e828d064c3678f')
