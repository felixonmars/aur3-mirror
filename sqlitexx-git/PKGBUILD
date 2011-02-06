# Contributor: Andreas Baumann <abaumann at yahoo dot com>

pkgname=sqlitexx-git
pkgver=20100215
pkgrel=4
pkgdesc="A C++ API for Sqlite."
arch=('i686' 'x86_64')
url='http://wiki.github.com/andreasbaumann/sqlitexx/'
license=('LGPL')
makedepends=('sqlite3>=3.0' 'doxygen')
depends=('sqlite3>=3.0')
provides=('sqlitexx')
md5sums=()

_gitroot="git://github.com/andreasbaumann/sqlitexx.git"
_gitname="sqlitexx"

build() {
  cd ${srcdir}

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  make || return 1
  make doc || return 1
  make DESTDIR=${pkgdir} install || return 1

  rm -rf ${srcdir}/$_gitname-build
}
