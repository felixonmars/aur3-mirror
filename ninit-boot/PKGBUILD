pkgname=ninit-boot
pkgver=0.1
pkgrel=1
url="https://github.com/ShadowKyogre/ninit-boot"
license=('custom')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ShadowKyogre/${pkgname}/archive/${pkgver}.tar.gz")
depends=(ninit)
backup=(etc/ninit/{daemons,default}/depends etc/ninit/gettys/{params,environ}.tpl)

package() {
  cd "${srcdir}/ninit-boot-${pkgver}"
  mkdir -p "${pkgdir}/etc/ninit"
  mkdir -p "${pkgdir}/usr/share/licenses/ninit-boot/"
  cp -R daemons default gettys halt reboot system-prep "${pkgdir}/etc/ninit"
  cp LICENSE "${pkgdir}/usr/share/licenses/ninit-boot/"
}
md5sums=('830893246423b8c28c4b5f8330000bba')
