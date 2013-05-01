# Contributor: rich_o <rich_o@lavabit.com>

_pkgname=gammu
pkgname=gammu-git
pkgver=1.32.0.190.gce17b53
pkgrel=1
pkgdesc="GNU All Mobile Management Utilities"
arch=('i686' 'x86_64')
url="http://wammu.eu/"
license=('GPL')
depends=('bluez' 'curl' 'libmariadbclient'
         'postgresql-libs' 'libusb')
makedepends=('cmake' 'doxygen' 'mariadb')
optdepends=('dialog: support for the gammu-config script')
conflicts=('python-gammu' 'gammu' 'gammu-svn')
provides=('python-gammu' 'gammu')
source=('git://github.com/gammu/gammu.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  git describe --always | sed -e 's|-|.|g'
}

build() {
  cd "$_pkgname"

  # bash completion dir change
  sed -i 's,DESTINATION "/etc/bash_completion.d",DESTINATION "/usr/share/bash-completion/completions",' contrib/CMakeLists.txt

  cmake . -DCMAKE_INSTALL_PREFIX="/usr" -DLIB_SUFFIX=""

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
