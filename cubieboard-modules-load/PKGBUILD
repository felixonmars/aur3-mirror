# Maintainer: Georges Discry <georges at discry dot be>

pkgname=cubieboard-modules-load
pkgver=1
pkgrel=1
pkgdesc="Configure kernel modules to load at boot for the Cubieboard"
arch=('any')
url="http://cubieboard.org/"
license=('custom')
source=('cubieboard.conf')
md5sums=('763cce8dba8f6c8c121c300cc10e7c8e')

package() {
  install -m755 -d "${pkgdir}/usr/lib/modules-load.d"
  install -m644 "${srcdir}/cubieboard.conf" "${pkgdir}/usr/lib/modules-load.d/"
}
