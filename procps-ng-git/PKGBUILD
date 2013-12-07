# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=procps-ng-git
pkgver=3.3.8.49.gd66ed33
pkgrel=1
pkgdesc="Debian, Fedora and openSUSE fork of procps. For more information about upstream see"
arch=('i686' 'x86_64')
url="https://gitorious.org/procps"
license=('GPL' 'LGPL')
depends=('ncurses')
makedepends=('git')
provides=('procps-ng')
conflicts=('procps-ng')
replaces=('procps')
source=(git://gitorious.org/procps/procps.git)
md5sums=('SKIP')

pkgver() {
  cd procps

  git describe | sed s,-,.,g\;s,^v,,
}

build() {
  cd procps

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --exec-prefix=/ \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \

  make
}

package() {
  cd procps

  make DESTDIR="$pkgdir" install

  # provided by util-linux
  rm "$pkgdir/usr/bin/kill"
  rm "$pkgdir/usr/share/man/man1/kill.1"
}

# vim:set ts=2 sw=2 et:
