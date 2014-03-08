# Contributor: Jacek Burghardt
pkgname=python2-libvirt
_pkgname=python-libvirt
pkgver=1.2.2
pkgrel=2
pkgdesc="python bindings for libvirt"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/libvirt-python/"
license=('GPL2')
groups=()
depends=('python2' 'libnl')
makedepends=('asciidoc')
provides=(python2-libvirt)
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(https://pypi.python.org/packages/source/l/libvirt-python/libvirt-python-$pkgver.tar.gz)
sha256sums=('94d79d662b6010f6c688b8856b2d95077736d48ffa35feed5a339d7fafbf8c39')

build() {
  cd "$srcdir/libvirt-python-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/libvirt-python-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -d "$pkgdir/usr/bin"
  }

# vim:set ts=2 sw=2 et:
