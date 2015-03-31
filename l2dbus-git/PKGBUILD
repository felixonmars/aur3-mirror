# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>
_pkgname=l2dbus
pkgname=l2dbus-git
pkgver=2015_03_30..7f1ff19
pkgrel=1
pkgdesc="Lua module that provides a *nearly* complete binding to the D-Bus IPC service"
arch=('any')
url="https://github.com/xs-embedded-llc/l2dbus"
license=('MIT')
depends=('dbus>=1.4' 'lua>=5.1' 'cdbus-git')
optdepends=('libev>=4.00' 'glib>=2.0')
makedepends=('cmake>=2.6')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/xs-embedded-llc/${_pkgname}")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd..%h' --date=short | tr - _
}

build() {
  cd "$srcdir/$_pkgname"

  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
  make
}

package() {
  cd "$srcdir/$_pkgname"

  make install
}

# vim:set ts=2 sw=2 et:
