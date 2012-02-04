# Maintainer: Jianing Yang <jianingy.yang at gmail dot com>

pkgname=evolution-indicator-marella-bzr
pkgbranch=0.2.0
pkgver=0.2.8
pkgrel=1
pkgdesc="A plugin for Evolution that uses libindicate and libnotify to provide additional information to the shell about Evolution's state."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~francesco-marella/evolution-indicator/2.30-compat"
license=('GPL')
depends=()
makedepends=('libindicator' 'bzr')
source=()
md5sums=()

build() {
  cd $srcdir || return 1
  bzr branch lp:~francesco-marella/evolution-indicator/2.30-compat || return 1
  cd 2.30-compat || return 1
  ./autogen.sh || return 1
  ./configure --prefix=/usr --disable-static || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
