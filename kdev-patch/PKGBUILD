# Mantainer: Berseker <berseker86 at gmail.com>

pkgname=kdev-patch
pkgver=20121127
pkgrel=1
pkgdesc="kdevelop with patch function"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch%2Fnarvaez%2Fkdev-patch.git"
license=('GPL')
depends=('kdevplatform-git')
conflict=('kdevplatform')
makedepends=('cmake')
options=('strip')
_gitroot="git://anongit.kde.org/scratch/narvaez/kdev-patch.git"
_gitname="kdev-patch"

build() {
  msg "Connecting to GIT server..."
  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf ${srcdir}/build
  cd ${srcdir}/${_gitname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
  make DESTDIR=$pkgdir install
}
