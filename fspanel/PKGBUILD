#Maintainer: hellwoofa ([at] arcor [dot] de)
pkgname=fspanel
pkgver=0.8beta1
pkgrel=4
pkgdesc="F***ing Small Panel. EWMH-compliant."
url="http://www.chatjunkies.org/fspanel"
arch=('i686')
license=()
source=(http://home.arcor.de/hellwoofa/$pkgname-$pkgver.tar.gz patch.arch)
depends=('libxpm')
md5sums=('213ea167a50c4971c3c110db9b4be4e9' '13098d1b4cea739219104ef6a1474881')
build() {
  cd $startdir/src/$pkgname-$pkgver
  patch <../patch.arch configure
  ./configure 
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp fspanel $startdir/pkg/usr/bin
}
