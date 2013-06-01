# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=whosthere-git
pkgver=105.0688604
pkgrel=1
pkgdesc="A WhatsApp client for Ubuntu (Phone)"
arch=('i686' 'x86_64')
url="https://github.com/mgehre/whosthere"
license=('GPL2')
depends=('telepathy-whosthere-git' 'qt5-pim-git' 'ubuntu-ui-toolkit-bzr')
makedepends=('git')
provides=('whosthere')
conflicts=('whosthere')
source=(whosthere::git://github.com/mgehre/whosthere.git)
md5sums=('SKIP')

pkgver() {
  cd whosthere
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd whosthere
  qmake-qt5
  make
}

package() {
  cd whosthere
  make INSTALL_ROOT="$pkgdir/usr" install
}
