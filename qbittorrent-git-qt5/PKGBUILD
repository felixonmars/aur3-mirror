# Maintainer: bigc
# Contributor: bigc

pkgname=qbittorrent-git-qt5
pkgver=.5403
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt5 using the good libtorrent library"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('qt5-base' 'libtorrent-rasterbar')
makedepends=('boost' 'which')
optdepends=('python: needed for search')
conflicts=('qbittorrent')
provides=('qbittorrent')
install=qbittorrent.install
source=('git://github.com/qbittorrent/qBittorrent.git')
md5sums=('SKIP')

pkgver() {
  cd qBittorrent
  echo $(cat version.pri | grep -o '[0-9]..*[0-9]').$(git rev-list --count master)
}

prepare() {
 # Spoof uTorrent [ change to 'yes' ]
  _utspoof='no'

  if [ $_utspoof = 'yes' ]; then
    sed -i 's/\"qBittorrent\ \"VERSION/\"uTorrent\/3300\(29677\)\"/' \
    qBittorrent/src/qtlibtorrent/qbtsession.cpp
  fi
}

build() {
  cd qBittorrent
  ./configure --with-qt5 --prefix=/usr
  make
}

package() {
  cd qBittorrent
  make INSTALL_ROOT="$pkgdir/" install
}
