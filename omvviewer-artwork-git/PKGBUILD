# Contributor: Medical-Wei/Lanny Bikcin <medicalwei at gmail dot com>

pkgname=omvviewer-artwork-git
pkgver=20090314
pkgrel=1
pkgdesc="Artwork files for Open Metaverse Viewer"
arch=('i686' 'x86_64')
url="http://omvviewer.byteme.org.uk/index.shtml"
license=('custom')
conflicts=('omvviewer-artwork')
provides=('omvviewer-artwork')
depends=()
makedepends=('git' 'make')
md5sums=()

_gitroot="git://git.byteme.org.uk/home/git/slviewer-artwork.git"
_gitname="slviewer-artwork"

build() {
  cd $srcdir

  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    (cd $_gitname && git pull origin)
  else
    git clone $_gitroot $_gitname
    (cd $_gitname && git checkout -b linux origin/linux)
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

#  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build

  make INSTALL=$pkgdir/usr/share/omvviewer/ install || return 1
}
