# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-inbsanity.org>

pkgname=owncloud-app-files-mv
pkgver=0.7.0
pkgrel=1
pkgdesc="Move dialog integrated in the owncloud-file-manager"
arch=('any')
url="http://apps.owncloud.com/content/show.php/Files+move?content=150271"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.zip::http://apps.owncloud.com/CONTENT/content-files/150271-files_mv.zip")
sha512sums=("c9c96f7f1aad4c74374b3e56cb9692235e38d70ed70f1dc59a4277998827cd1d9b3e20d481e3f16da0e697adee7c00067af613a3f4be06cf5f734d5530beaae6")

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/files_mv" "${pkgdir}/usr/share/webapps/owncloud/apps/files_mv"
}
