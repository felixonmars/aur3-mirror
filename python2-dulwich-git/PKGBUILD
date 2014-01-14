# Contributor: Hervé Cauwelier <herve ¤ oursours.net>

pkgname="python2-dulwich-git"
pkgver=0.9.4.28.gb19f94b
pkgrel=1
pkgdesc="Pure-Python implementation of the Git file formats and protocols"
url="http://samba.org/~jelmer/dulwich/"
depends=('python2')
makedepends=('git' 'python2-setuptools')
provides=('python2-dulwich')
conflicts=('python2-dulwich')
arch=('i686' 'x86_64')
license=('GPL2')

source=('git://git.samba.org/jelmer/dulwich.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/dulwich"
  git describe --long | sed 's/dulwich-//; s/-/./g'
}

package() {
  cd "$srcdir/dulwich"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
