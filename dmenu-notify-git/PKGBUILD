# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname='dmenu-notify-git'
pkgver=0.2
pkgrel=4
pkgdesc="A fork of dmenu that includes features like eager matching of options and displaying notifications without a menu"
arch=('i686' 'x86_64')
url="https://github.com/stilvoid/dmenu"
license=('MIT')
depends=('libx11')
makedepends=('git')
provides=('dmenu')
conflicts=('dmenu')

build() {
  cd "$srcdir"

  if [ -d dmenu-notify ]; then
    cd dmenu-notify
    git checkout master
    git pull
  else
    git clone git://github.com/stilvoid/dmenu.git dmenu-notify
  fi

  cd "$srcdir/dmenu-notify"
  make || return 1
}

package() {
  cd "$srcdir/dmenu-notify"
  install -Dm644 ${srcdir}/dmenu-notify/LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  make MANPREFIX="$pkgdir/usr/share/man" PREFIX="$pkgdir/usr" install || return 1
}

