# Maintainer: Ricardo Vieira <ricardo.vieira@tecnico.ulisboa.pt>

pkgname=owncloud-app-pdfviewer
pkgver=8.0.3
pkgrel=1
pkgdesc="PDF.js app for owncloud"
arch=('any')
url="http://owncloud.org/"
license=('GPL')
depends=('owncloud')
makedepends=()
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/owncloud/files_pdfviewer/archive/v$pkgver.tar.gz")
sha256sums=('e5991773d2cd969660ce2a6e88a69129816a323753c56be4f8fe590e46a6ad78')

package() {
  install -d ${pkgdir}/usr/share/webapps/owncloud/apps
  cp -a ${srcdir}/files_pdfviewer-$pkgver ${pkgdir}/usr/share/webapps/owncloud/apps/files_pdfviewer
}
