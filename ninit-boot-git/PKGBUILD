pkgname=ninit-boot-git
pkgver=0.1.1.r1.g8cc84c6
pkgrel=1
url="https://github.com/ShadowKyogre/ninit-boot"
license=('custom')
arch=('any')
source=("git+https://github.com/ShadowKyogre/${pkgname%%-git}")
depends=(ninit)
conflicts=("${pkgname%%-git}")
backup=(etc/ninit/{daemons,default}/depends etc/ninit/gettys/{params,environ}.tpl)

pkgver() {
  cd "${pkgname%%-git}"
  git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname%%-git}"
  mkdir -p "${pkgdir}/etc/ninit"
  mkdir -p "${pkgdir}/usr/share/licenses/ninit-boot/"
  cp -R daemons default gettys halt reboot system-prep "${pkgdir}/etc/ninit"
  cp LICENSE "${pkgdir}/usr/share/licenses/ninit-boot/"
}
md5sums=('SKIP')
