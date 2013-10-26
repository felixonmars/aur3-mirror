# Maintainer: speps <speps dot aur dot archlinux dot org>

_mltver=0.9.0
pkgname=webvfx
pkgver=0.4.4
pkgrel=1
pkgdesc="Video effects engine based on web technologies"
arch=('i686' 'x86_64')
url="https://github.com/rectalogic/webvfx"
license=('custom:BSD')
depends=('qtwebkit' 'mlt')
source=("$url/archive/$pkgver.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/mlt/mlt-$_mltver.tar.gz")
md5sums=('1528b10123331a32c3e75da7632dea1b'
         '1cd2d73f3ffe77a43980e99aaa4ea06c')

build() {
  cd $pkgname-$pkgver
  qmake-qt4 -r PREFIX=/usr MLT_SOURCE="$srcdir/mlt-$_mltver"
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
