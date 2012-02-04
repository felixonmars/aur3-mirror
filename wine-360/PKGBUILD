# Maintainer: netherblood <netherblood.com>
pkgname=wine-360
pkgver=0.1
pkgrel=1
pkgdesc="Xbox 360 controller support for wine"
url="http://www.winehq.org"
arch=('x86_64' 'i686')
license=('GPL')
depends=('xboxdrv')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
_gitroot="https://code.google.com/p/wine-360/"

build() {
  cd "${srcdir}"

  msg "Connecting to GIT server..."

  if [ -d ${srcdir}/$pkgname ] ; then
    cd $pkgname && git pull origin master
    msg "Local repository updated."
  else
    git clone $_gitroot $pkgname
  fi

  cd "$srcdir/$pkgname"
  
  mkdir -p bin
  g++ src/wine-360.cpp -o bin/wine-360
  install -Dm755 "bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "dlls/x360ce.ini" "$pkgdir/usr/share/$pkgname/dlls/x360ce.ini"
  install -Dm644 "dlls/xinput1_3.dll" "$pkgdir/usr/share/$pkgname/dlls/xinput1_3.dll"
}
