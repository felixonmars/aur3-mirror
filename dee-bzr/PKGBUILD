# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=dee-bzr
pkgver=r437
pkgrel=1
pkgdesc="Model to synchronize multiple instances over DBus"
arch=('i686' 'x86_64')
url="https://launchpad.net/dee"
license=('LGPL')
groups=('unity')
depends=('dbus-glib' 'glib2' 'icu' 'python' 'python-gobject' 'python2' 'python2-gobject')
makedepends=('gnome-common' 'gobject-introspection' 'gtk-doc' 'vala')
provides=(dee{,-ubuntu}{,-bzr}=${pkgver})
conflicts=(dee{,-ubuntu})
source=("bzr+lp:dee")
sha512sums=('SKIP')

pkgver() {
  cd dee

  printf "r%s" "$(bzr revno)"
}

build() {
  cd "${srcdir}/dee"

  autoreconf -vfi

  mkdir build-python3 && cd build-python3
  PYTHON=python3 ../configure --prefix=/usr --enable-gtk-doc
  make
  cd ..

  mkdir build-python2 && cd build-python2
  PYTHON=python2 ../configure --prefix=/usr
}

package() {
  cd "${srcdir}/dee"

  cd build-python3/
  make DESTDIR="${pkgdir}/" install
  cd ..

  cd build-python2/bindings/python/
  make DESTDIR="${pkgdir}/" install
}
