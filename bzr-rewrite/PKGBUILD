# Contributor: Kambus

pkgname=bzr-rewrite
pkgver=0.6.3
pkgrel=1
pkgdesc="Plugin for Bazaar that provides various ways of rewriting existing revisions, including a rebase command similar to git's rebase."
arch=(i686 x86_64)
url="http://bazaar-vcs.org/Rebase"
license=('GPLv2')
depends=('python2' 'setuptools' 'bzr')
makedepends=('bzr')

source=(http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('37b629b1ac7087e9ce4bfc151735dbf0')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 ./setup.py install --prefix=/usr --root="${pkgdir}" -O1
}
