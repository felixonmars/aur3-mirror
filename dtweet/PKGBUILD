# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname='dtweet'
pkgver=0.1
pkgrel=2
pkgdesc="A simple script that uses dmenu-notify and ttytter to provide a clean, easy way to update twitter"
arch=('i686' 'x86_64')
url="https://github.com/stilvoid/dmenu/tree/twitter"
license=('MIT')
depends=('dmenu-notify-git' 'ttytter')
makedepends=('git')
install=install.sh

build() {
  cd "$srcdir"

  if [ -d dmenu-notify ]; then
    cd dmenu-notify
    git checkout twitter
    git pull
  else
    git clone git://github.com/stilvoid/dmenu.git dmenu-notify
  fi

  cd "$srcdir/dmenu-notify"
  git checkout twitter
}

package() {
  cd "$srcdir/dmenu-notify"
  install -Dm644 ${srcdir}/dmenu-notify/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 ${srcdir}/dmenu-notify/dtweet "${pkgdir}/usr/bin/dtweet"
}
