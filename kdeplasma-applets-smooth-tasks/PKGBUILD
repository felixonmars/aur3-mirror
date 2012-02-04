# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-smooth-tasks
pkgver=412
pkgrel=1
url="https://bitbucket.org/jimi312/smooth-tasks-kde-sc-4.6"
pkgdesc="A taskbar replacement Plasmoid with window peeking similar to Windows 7"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('automoc4' 'cmake' 'mercurial')

_hgroot="http://bitbucket.org/jimi312/"
_hgrepo="smooth-tasks-kde-sc-4.6"

build() {
  cd "${srcdir}"
  msg "Connecting to Mercurial server...."

  if [ -d $_hgrepo ] ; then
    cd $_hgrepo
    hg pull -u
    msg "The local files are updated."
  else
    hg clone $_hgroot $_hgrepo
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}"/build
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  cmake ../$_hgrepo \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
}
