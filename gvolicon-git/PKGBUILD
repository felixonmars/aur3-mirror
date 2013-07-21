# Maintainer: Unia <jthidskes@outlook.com> 

pkgname=gvolicon-git
_gitname=gvolicon
pkgver=2013.07.22
pkgrel=1
pkgdesc="A simple and lightweight volume icon that sits in your system tray, written in GTK3"
arch=('i686' 'x86_64')
url="http://unia.github.io/gvolicon/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'alsa-lib')
makedepends=('git')
source=('git://github.com/Unia/gvolicon.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
  cd $_gitname/
  make
}

package() {
  cd $_gitname/
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
