# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=python2-mongoengine
pkgver=0.8.7
pkgrel=1
pkgdesc="A Document-Object Mapper for working with MongoDB from Python"
arch=(any)
url="http://mongoengine.org/"
license=('MIT')
depends=('python2' 'python2-pymongo')
makedepends=('setuptools')
options=(!emptydirs)
source=("mongoengine-${pkgver}.tar.gz::https://github.com/mongoengine/mongoengine/tarball/v${pkgver}")
md5sums=('858a4305ce607097b4f1b82cd6ea3381')

_github_tag='0da694b'

package() {
    cd "$srcdir/MongoEngine-mongoengine-${_github_tag}/"
    python2 setup.py install --root="$pkgdir"
}
