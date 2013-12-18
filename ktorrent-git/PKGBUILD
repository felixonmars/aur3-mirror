# Maintainer: Daniel Riedemann <daniel.riedemann [at] googlemail [dot] com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ktorrent-git
pkgver=2104.e943da8
pkgrel=1
pkgdesc='A powerful BitTorrent client'
arch=('i686' 'x86_64')
url="http://ktorrent.org/"
license=('GPL')
depends=('kdebase-workspace' 'libktorrent-git' 'taglib')
makedepends=('cmake' 'automoc4' 'git' 'boost' 'docbook-xsl')
provides=(ktorrent)
conflicts=(ktorrent)
source=()
md5sums=()
install=ktorrent.install
_gitroot="git://anongit.kde.org/ktorrent"
_gitname="ktorrent"

build(){
  cd ${srcdir}

  if [[ -d $_gitname ]]; then
	(cd $_gitname && git pull origin)
  else
	git clone $_gitroot $_gitname
  fi

  mkdir -p build
  cd build

  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}

pkgver() {
  cd $srcdir/$_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
