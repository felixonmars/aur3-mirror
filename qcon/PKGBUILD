# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org> and Mathieu Pasquet <mathieui> <mathieuivi@gmail.com>

pkgname=qcon
pkgver=0.1.6
pkgrel=4
pkgdesc="Turns any X terminal emulator into a Quake-style console"
arch='any'
url="http://qcon.tabed.org"
license=('GPL')
depends=('python-wnck>=2', 'python2')
makedepends=('setuptools')
source=("$url/get/$pkgname-$pkgver.tar.gz")
md5sums=('7f46a47b6633e8ccfdb309bae325701d')
build() {
  cd ${srcdir}/$pkgname-$pkgver/

  python2 setup.py build || return 1
  python2 setup.py install --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
