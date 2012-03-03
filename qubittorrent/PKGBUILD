pkgname=qubittorrent
pkgver=2.9.5
pkgrel=1
pkgdesc="A bittorrent client written in C++ / Qt4 using libtorrent-rasterbar library (with uTorrent user-agent)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('qt' 'libtorrent-rasterbar' 'xdg-utils')
optdepends=('python: needed for search' 'geoip: improves peer country resolution')
makedepends=('boost' 'geoip')
provides=('qbittorrent')
conflicts=('qbittorrent qbittorrent-fake')
source=("http://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-${pkgver}.tar.gz")
md5sums=('c7729ad409d6132150f2674c5e646ac8')

build() {
  tar xf qbittorrent-${pkgver}.tar.gz
  cd qbittorrent-${pkgver}
  sed -i -e 's|sessionSettings.user_agent = "qBittorrent "VERSION;|sessionSettings.user_agent = "uTorrent/2210(25302)";|' \
         ./src/qtlibtorrent/qbtsession.cpp
  ./configure --prefix=/usr
  make
}

package() {
  cd qbittorrent-${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}

post_install() {
  xdg-icon-resource forceupdate --theme hicolor &> /dev/null
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}