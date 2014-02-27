# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>

pkgname=turbine-git
pkgver=0.1
pkgrel=1
pkgdesc="A GObject generator"
arch=(i686 x86_64)
url="https://git.gnome.org/browse/turbine/"
license=('GPL')
groups=()
depends=('python2' 'gtk' 'gobject-introspection')
makedepends=('git' 'python2')
provides=('turbine')
conflicts=('turbine')
#replaces=()
#backup=()
options=('!emptydirs')
source=("$pkgname"::'git+https://git.gnome.org/browse/turbine')
#noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  grep "PACKAGE_VERSION =" src/turbine/__init__.py | cut -d" " -f3 | sed -e 's/"//g'
}

build() {
  cd "$srcdir/$pkgname"
  
  /usr/bin/python2 ./setup.py build
}

package() {
  cd "$srcdir/$pkgname"

  /usr/bin/python2 ./setup.py install --prefix=/usr --root=$pkgdir/
}
