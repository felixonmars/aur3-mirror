# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgname=python2-codernitydb
_realname=CodernityDB
pkgver=0.4.2
pkgrel=1
pkgdesc="A Pure Python NoSQL Database."
arch=(any)
url="http://labs.codernity.com/codernitydb/index.html"
license=('APACHE')
depends=('python2')
source=("http://pypi.python.org/packages/source/C/${_realname}/${_realname}-${pkgver}.tar.gz")
md5sums=('9eccbd4f1d4aec78518853515672f7db')

package() {
    cd ${srcdir}/${_realname}-${pkgver}
    python2 setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
