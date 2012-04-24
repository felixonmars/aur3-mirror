# Maintainer: Jakub Kozisek <nodevel at gmail dot com>

pkgname=nepomuktvnamer-git
pkgver=20120424
pkgrel=1
pkgdesc="Nepomuk TV Show manager."
arch=('any')
url="http://trueg.wordpress.com/2012/01/28/something-way-less-dry-tv-shows/"
license=('GPLv2')
depends=('kdebase-runtime>=4.5.80' 'shared-desktop-ontologies-git' 'soprano' 'libtvdb-git')
makedepends=('git' 'cmake')
conflicts=('nepomuktvnamer')
replaces=('nepomuktvnamer')

_gitroot="git://anongit.kde.org/nepomuktvnamer.git"
_gitname="nepomuktvnamer"

source=(fix-gcc-4.7.patch)
md5sums=('01c937f65c25214f49dd1fdfb89cf017')

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot} && cd ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Patching..."
  patch -p1 -i ${srcdir}/fix-gcc-4.7.patch
  msg "Starting make..."
  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) -DCMAKE_BUILD_TYPE=Release ./
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
