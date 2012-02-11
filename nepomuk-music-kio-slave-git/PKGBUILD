# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=nepomuk-music-kio-slave-git
pkgver=20120211
pkgrel=1
pkgdesc="Music KIO slave for Nepomuk"
arch=('any')
url="http://trueg.wordpress.com/2012/02/10/just-for-the-fun-of-it-browsing-music-with-nepomuk/"
license=('GPLv2')
depends=('kdebase-runtime>=4.5.80' 'shared-desktop-ontologies-git' 'soprano')
makedepends=('git' 'cmake')
conflicts=('nepomuk-music-kio-slave')
replaces=('nepomuk-music-kio-slave')

_gitroot="git://anongit.kde.org/scratch/trueg/nepomuk-music-kio-slave.git"
_gitname="nepomuk-music-kio-slave"

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
  # Resolve 'shared-desktop-ontologies-git' problem - ugly hack (removes version specification, originally 0.8.35)
  sed -i '/SDO_MIN_VERSION/d' ./nepomuk-music-kio-slave/CMakeLists.txt
  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ./${_gitname}
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
