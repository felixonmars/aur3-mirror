# Maintainer: Gonzalo Ciruelos <gonzalo.ciruelos@gmail.com> 

pkgname=maggot-git
_gitname=maggot
pkgver=0.0.4
pkgrel=1
pkgdesc="Simple snake game written in C"
arch=('i686' 'x86_64')
url="https://github.com/gciruelos/maggot"
license=('GPL2')
depends=('glibc' 'cmake')
makedepends=('git')
source=('git://github.com/gciruelos/maggot.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git tag
}

build() {
  cd $_gitname
  cd src
  cmake .
  make
}

package() {
  cd $_gitname/src
  install -Dm755 $_gitname "$pkgdir/usr/bin/$_gitname"
}
