# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=python2-restkit
pkgver=4.0.0
pkgrel=1
pkgdesc="Restkit is an HTTP resource kit for Python. It allows you to easily access to HTTP resource and build objects around it."
arch=('any')
url="http://benoitc.github.com/restkit/index.html"
license=('MIT')
depends=('python2' 'python-http-parser' 'python2-socketpool')
makedepends=('python2-distribute')
provides=()
conflicts=('python-restkit' 'restkit-git' 'python2-restkit-git')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/r/restkit/restkit-$pkgver.tar.gz"
  "doc.patch")
md5sums=('1bb0fa0115f82803472a2a6a8a30cf30'
         '87fa9d990c28e3f328b31e322343b157')

package() {
  cd "$srcdir/restkit-$pkgver"

  # Install doc at the proper location
  patch -p1 < "$srcdir/doc.patch"

  # Remove tests directory (conflicts with other python packages)
  rm -rf tests

  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

}

# vim:set ts=2 sw=2 et:
