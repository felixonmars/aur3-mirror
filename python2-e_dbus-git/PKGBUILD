# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: furester <furester at gmail dot com>
# Contributor: Changaco <changaco Î±Ï„ changaco Î´Î¿Ï„ net>

pkgname=python2-e_dbus-git
_pkgname=python-e_dbus
pkgver=1.7.0.58.0a567b0
pkgrel=1
pkgdesc="Python2 bindings for E_DBus - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('efl-git' 'python2-dbus')
makedepends=('git')
provides=('python2-e_dbus')
conflicts=('python2-e_dbus' 'python2-e_dbus-svn')
options=('!libtool')
source=("git://git.enlightenment.org/legacy/bindings/python/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  PYTHON=/usr/bin/python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
