# Maintainer: Fabio Zottele <fabio . zottele @ gmail . com>

pkgname=nepomuk-metadata-extractor-git
_realname=nepomuk-metadata-extractor
pkgver=20120416
pkgrel=1
pkgdesc="Finds additional metadata on the internet (via Python plugins) and adds it to nepomuk"
arch=('x86_64')
url="https://projects.kde.org/projects/playground/base/nepomuk-metadata-extractor"
license=('GPL')
depends=('kdepim-runtime')
conflicts=('nepomuk-core')
makedepends=('cmake' 'automoc4' 'git')
md5sums=()

_gitroot="git://anongit.kde.org/${_realname}"
_gitname=${_realname}

build() {
  cd ${srcdir}

  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  git clone ${srcdir}/${_gitname} ${srcdir}/build
  cd ${srcdir}/build
 
  cmake . -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  rm -fr $pkgdir/usr/share/dbus-1
  rm -fr $pkgdir/usr/lib/libnepomukdatamanagement-copy.so
}
