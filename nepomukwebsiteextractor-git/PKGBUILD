# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=nepomukwebsiteextractor-git
pkgver=20120211
pkgrel=2
pkgdesc="Extract web links from Nepomuk resources"
arch=('any')
url="http://trueg.wordpress.com/2012/02/02/a-little-drier-but-not-that-dry-extracting-websites-from-nepomuk-resources/"
license=('GPLv2')
depends=('kdebase-runtime>=4.5.80' 'soprano' 'libtvdb')
makedepends=('git' 'cmake')
conflicts=('nepomukwebsiteextractor')
replaces=('nepomukwebsiteextractor')

_gitroot="git://anongit.kde.org/scratch/trueg/nepomukwebsiteextractor.git"
_gitname="nepomukwebsiteextractor"

source=()
md5sums=()

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."
  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ./
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
