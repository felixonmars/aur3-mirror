# Maintainer: DrZaius <lou[at]fakeoutdoorsman.com>

pkgname=libnut-git
_gitname="libnut"
pkgver=673.5e471c2
pkgrel=1
pkgdesc="Free multimedia container format"
arch=('i686' 'x86_64')
url="http://wiki.multimedia.cx/index.php?title=NUT"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=('libnut::git://git.ffmpeg.org/nut.git')
sha1sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname/src/trunk
  make PREFIX=/usr
}

package() {
  cd $_gitname/src/trunk
  make PREFIX=/usr DESTDIR=$pkgdir install
}
