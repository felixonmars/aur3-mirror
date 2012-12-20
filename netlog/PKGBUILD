# Maintainer: lemanyk <lemanyk@gmail.com>
pkgname=netlog
pkgver=0.2
pkgrel=3
epoch=
pkgdesc='logging stream server written on gevent'
arch=('any')
url='https://github.com/lemanyk/netlog'
license=('MIT')
groups=()
depends=('python2' 'python2-gevent')
makedepends=('setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://pypi.python.org/packages/source/n/netlog/netlog-$pkgver.tar.gz)
noextract=()
md5sums=('2a6323ad34457e491817b59626c436f5') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
