# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=python-tre
pkgver=0.8.0
pkgrel=2
pkgdesc="POSIX compliant regexp matching library with approximate matching support. Python module"
arch=(any)
url="http://laurikari.net/tre/index.html"
license=('BSD')
groups=()
depends=(python tre)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://laurikari.net/tre/tre-$pkgver.tar.bz2)
noextract=()
md5sums=('b4d3232593dadf6746f4727bdda20b41')


build() {
  cd "$srcdir/tre-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  cd python
  umask 022
  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
  install -D -m644 $srcdir/tre-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
