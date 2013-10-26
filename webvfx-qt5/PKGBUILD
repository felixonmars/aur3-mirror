# Maintainer: speps <speps dot aur dot archlinux dot org>

_mltver=0.9.0
_git=c659523e95eb8dfcfc2b6a6b72e5e220a4f700d8
pkgname=webvfx-qt5
pkgver=0.4.4+git.399
pkgrel=1
pkgdesc="Video effects engine based on web technologies"
arch=('i686' 'x86_64')
url="https://github.com/rectalogic/webvfx"
license=('custom:BSD')
depends=('qt5-quick1' 'mlt')
provides=('webvfx')
conflicts=('webvfx')
source=("$url/archive/$_git.tar.gz"
        "http://downloads.sourceforge.net/sourceforge/mlt/mlt-$_mltver.tar.gz")
md5sums=('64fb7f49232bfe0f2f45192eec807396'
         '1cd2d73f3ffe77a43980e99aaa4ea06c')

build() {
  cd webvfx-$_git
  qmake -r PREFIX=/usr MLT_SOURCE="$srcdir/mlt-$_mltver"
  make
}

package() {
  cd webvfx-$_git
  make INSTALL_ROOT="$pkgdir/" install

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
