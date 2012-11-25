# Maintainer: Felix Yan <felixonmars@gmail.com>

_pkgbase=fcitx-configtool
pkgname=fcitx-configtool-gtk2
pkgver=0.4.5.1
pkgrel=1
pkgdesc="GTK2 based config tool for Fcitx."
arch=('i686' 'x86_64')
url="http://fcitx.googlecode.com/"
license=('GPL2')
depends=("fcitx>=4.2.6" "gtk2" "libunique" "iso-codes")
makedepends=(cmake)
source=(http://fcitx.googlecode.com/files/$_pkgbase-$pkgver.tar.xz)

build() {
  cd "$srcdir"/$_pkgbase-$pkgver
  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_GTK2=On -DENABLE_GTK3=Off ..
  make
}

package() {
  cd "$srcdir"/$_pkgbase-$pkgver/build
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/locale/zh_CN/LC_MESSAGES/fcitx-configtool.mo \
     "$pkgdir"/usr/share/locale/zh_CN/LC_MESSAGES/fcitx-configtool-gtk2.mo
  mv "$pkgdir"/usr/share/locale/zh_TW/LC_MESSAGES/fcitx-configtool.mo \
     "$pkgdir"/usr/share/locale/zh_TW/LC_MESSAGES/fcitx-configtool-gtk2.mo
}

md5sums=('6787dedcb57e6147553ef755c51bb46b')
