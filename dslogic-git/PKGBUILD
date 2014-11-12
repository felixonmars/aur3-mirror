# Maintainer: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=dslogic-git
pkgver=34.7c8b0b1
pkgrel=1
pkgdesc="Client software that supports the DSLogic DreamSourceLab logic analyzer"
arch=('i686' 'x86_64')
url="http://www.dreamsourcelab.com/"
license=('GPL3')
depends=('boost-libs' 'qt4' 'libsigrok4dslogic-git' 'libsigrokdecode-git')
makedepends=('boost')
conflicts=('dslogic')
source=("git+https://github.com/DreamSourceLab/DSLogic.git"
        'dslogic.desktop')
md5sums=('SKIP'
         'de092f197a97096aaf05da997cd55ea9')
install=dslogic.install

pkgver() {
  cd "$srcdir/DSLogic"

  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/DSLogic/DSLogic-gui"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DFORCE_QT4=1 .
  make
}

package() {
  cd "$srcdir/DSLogic/DSLogic-gui"

  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 ../../dslogic.desktop "$pkgdir/usr/share/applications/dslogic.desktop"
}

# vim:set ts=2 sw=2 et:
