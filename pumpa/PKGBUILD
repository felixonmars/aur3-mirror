# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=pumpa
pkgver=0.9
pkgrel=2
pkgdesc="A simple pump.io client written in C++ and Qt"
arch=('i686' 'x86_64')
url="http://gitorious.org/pumpa"
license=('GPL3')
depends=('qt5-base' 'aspell' 'hicolor-icon-theme' 'tidyhtml')
install="$pkgname.install"
source=("$url/pumpa/archive/v$pkgver.tar.gz")
md5sums=('2fc740b6063ad0a46a520489ba1f9117')

build() {
  cd $pkgname-$pkgname
  qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgname
  make INSTALL_ROOT="$pkgdir/" install
}
