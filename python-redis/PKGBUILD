# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Pierre Gueth <pierre.gueth@gmail.com>

pkgname=python-redis
_basename=redis
pkgver=2.9.1
pkgrel=2
pkgdesc="The Python interface to the Redis key-value store."
arch=(any)
url="http://github.com/andymccurdy/redis-py"
license=('custom')
depends=('python')
source=("https://pypi.python.org/packages/source/r/${_basename}/${_basename}-${pkgver}.tar.gz")
md5sums=('1da8ff78be75d7acf5d4684e77fc3606')

package() {
    cd ${srcdir}/${_basename}-${pkgver}
    python setup.py install --root=${pkgdir}/ --optimize=1
}

# vim:set ts=4 sw=4 et:
