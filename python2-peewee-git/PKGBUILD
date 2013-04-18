pkgname=python2-peewee-git
_gitname="peewee"
pkgver=4f9177e
pkgrel=1
pkgdesc="A small, expressive ORM for Python. Supports postgresql, mysql and sqlite."
arch=('i686' 'x86_64')
url="http://peewee.readthedocs.org/"
depends=('python2' 'git')
optdepends=(python2-psycopg2 mysql-python)
license=('MIT')
source=("git://github.com/coleifer/peewee.git")
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    # Use the tag of the last commit
    git describe --always | sed 's|-|.|g'
}

package() {
    cd $_gitname
    python2 setup.py install --prefix=/usr --root=$pkgdir
}
