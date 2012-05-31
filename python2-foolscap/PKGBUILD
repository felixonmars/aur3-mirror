# $Id$
# Maintainer: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: giniu <gginiu@gmail.com>
pkgname=python2-foolscap
_basename=foolscap
pkgver=0.6.3
pkgrel=3
pkgdesc="RPC protocol for Python and Twisted"
license=('MIT')
url="http://foolscap.lothar.com/"
arch=(any)
depends=('twisted' 'python2' 'python2-pyopenssl')
makedepends=('python2-distribute')
options=(!emptydirs)
conflicts=(python-foolscap)
replaces=(python-foolscap)
source=("${url}releases/${_basename}-${pkgver}.tar.gz"
        "${url}releases/${_basename}-${pkgver}.tar.gz.asc")
md5sums=('38782e3b64d3a0beea1ae03dd9ca137f'
         '19a0b941d5706f4e87f1e1782e59ea49')

package() {
  cd "$srcdir/${_basename}-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
