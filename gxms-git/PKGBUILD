# Maintainer: Unia <jthidskes@outlook.com> 

pkgname=gxms-git
_gitname=gxms
pkgver=2013.04.12
pkgrel=1
pkgdesc="A desktop client to eBuddy XMS, using Webkit"
arch=('i686' 'x86_64')
url="https://github.com/Unia/gxms"
license=('GPL2')
depends=('gtk3' 'webkitgtk')
makedepends=('git' 'intltool')
source=('git://github.com/Unia/gxms.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
