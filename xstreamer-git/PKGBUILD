pkgname=xstreamer-git
pkgver=7
pkgrel=2
pkgdesc="Streaming Utility for Linux, using C++ and QT"
arch=(i686 x86_64)
license=("unknown")
depends=(qt4)
makedepends=(git)
url="https://github.com/Pholey/Xstreamer"
source=("${pkgname%-*}::git+https://github.com/Pholey/Xstreamer.git"
"xstreamer.desktop")
md5sums=('SKIP'
         '08a8ff079b61e3a4ae84cb795ea6218a')

pkgver () {
  cd "$srcdir/${pkgname%-*}"
  echo $(git rev-list --count master)
}

build() {
  cd "$srcdir/${pkgname%-*}"
  qmake-qt4 Xstreamer.pro
  sed -i "s,-I<your -Ipath>,,g" Makefile
  make
  g++ S.cpp -o S
}

package() {
  cd "${srcdir}/${pkgname%-*}/"
  install -Dm755 Xstreamer "$pkgdir/usr/bin/Xstreamer"
  install -m755 S "$pkgdir/usr/bin/"
  install -Dm644 "$srcdir/xstreamer.desktop" "$pkgdir/usr/share/applications/xstreamer.desktop"
}
