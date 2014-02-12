# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=trousseau-git
pkgver=20131218
pkgrel=1
pkgdesc="Networked and encrypted key-value database"
arch=('any')
depends=('gnome-keyring' 'gnupg')
makedepends=('git' 'go')
url="https://github.com/oleiade/trousseau"
license=('MIT')
source=(git+https://github.com/oleiade/trousseau)
sha256sums=('SKIP')
provides=('trousseau')
conflicts=('trousseau')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  make all
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  install -Dm755 bin/trousseau "$pkgdir/usr/bin/trousseau"
}
