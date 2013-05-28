# Contributor: Mathieu Pasquet <mathieui@mathieui.net>
pkgname=python2-couchdbkit-git
pkgver=20110223
pkgrel=1
pkgdesc="A framework to allow python applicationto use CouchDB - Git version"
arch=('i686' 'x86_64')
url="http://couchdbkit.org"
license=('CUSTOM') # custom but free
depends=('python2-anyjson' 'python2-restkit')
optdepends=('couchdb: for setting up a local couchdb server' 'django: for couchdbkit’s django extension')
makedepends=('setuptools' 'git')

source=("git://github.com/benoitc/couchdbkit.git")
md5sums=("SKIP")

build() {
  cd "$srcdir/couchdbkit"

  python2 setup.py build
}

package() {
  cd "$srcdir/couchdbkit"
  python2 setup.py install --root=$pkgdir || return 1
  install -m 644 -D LICENSE $pkgdir/usr/share/licenses/python-couchdbkit/LICENSE
}
