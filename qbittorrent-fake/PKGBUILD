# Contributor: B.Vasilyev <bobartmail@gmail.com>

pkgname=qbittorrent-fake
pkgver=2.8.4
pkgrel=2
pkgdesc="A bittorrent client written in C++ / Qt4 using the good libtorrent library with fake of user-agent to uTorrent"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('qt' 'libtorrent-rasterbar' 'xdg-utils')
makedepends=('boost' 'geoip')
optdepends=('python2: needed for search'
            'geoip: improves peer country resolution')
provides=('qbittorrent')
conflicts=('qbittorrent')
install='qbittorrent.install'
source=("http://downloads.sourceforge.net/sourceforge/qbittorrent/qbittorrent-${pkgver}.tar.gz"
        'python2.patch' 'rutracker.patch')
md5sums=('85bbc6fe250bf86e734e9891e7c06d6f'
         '9b4374590f1d4e2bc4c7f79ffbd9acaf'
         'd2d3cf670777aadeabcbe7561e09b7a4')

build() {

cd qbittorrent-${pkgver}

  patch -Np1 -i ${srcdir}/rutracker.patch

  sed -i \
    -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find ./ -name '*.py')

  patch -Np1 -i ${srcdir}/python2.patch

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd qbittorrent-${pkgver}

  make INSTALL_ROOT=${pkgdir} install
}
