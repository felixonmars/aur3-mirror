# Maintainer: Ryan Jacobs <ryan.mjacobs@gmail.com>
pkgname=imgui
pkgver=1.11
pkgrel=1
pkgdesc="Bloat-free Immediate Mode Graphical User interface for C++ with minimal dependencies"
arch=('i686' 'x86_64')
url="https://github.com/ocornut/imgui"
license=('MIT')
depends=()
options=()
source=(https://github.com/ocornut/imgui/archive/v$pkgver.tar.gz)
md5sums=('a3f67461f03f9171254c3c64b20fd989')

condense_header() {
  cd "$srcdir/$pkgname-$pkgver"

  # Remove imconfig.h include
  # Hopefully they fix this issue soon
  sed -i '/#include "imconfig\.h"/d' imgui.h
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  condense_header

  # .a
  gcc -c -o imgui.o imgui.cpp
  ar -rsc libimgui.a imgui.o

  # .so
  gcc -fPIC -shared -o libimgui.so imgui.cpp
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm 0644 imgui.h     $pkgdir/usr/include/imgui.h
  install -Dm 0644 libimgui.a  $pkgdir/usr/lib/libimgui.a
  install -Dm 0755 libimgui.so $pkgdir/usr/lib/libimgui.so
}
