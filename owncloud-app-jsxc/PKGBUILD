# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-inbsanity.org>

pkgname=owncloud-app-jsxc
pkgver=1.1.0
pkgrel=1
pkgdesc="Facebook-like XMPP chat for owncloud with OTR-encryption"
arch=('any')
url="http://apps.owncloud.com/content/show.php/JavaScript+XMPP+Chat?content=162257"
license=('MIT')
depends=('owncloud')
makedepends=()
options=('!strip')
#source=("$pkgname-$pkgver.zip::https://github.com/sualko/ojsxc/archive/v${pkgver}.tar.gz")
source=("https://apps.owncloud.com/CONTENT/content-files/162257-ojsxc-$pkgver.zip")
md5sums=('8065b15fbda996673f329c4c5b4e969f')

package() {
  install -d "${pkgdir}/usr/share/webapps/owncloud/apps"
  cp -a "${srcdir}/ojsxc" "${pkgdir}/usr/share/webapps/owncloud/apps/ojsxc"
}
