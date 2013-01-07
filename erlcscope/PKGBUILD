# Maintainer: Jan <jangingnicht@web.de>
# I am only maintaining this package. Bugs and suggestions should be directed to
# the original author here: https://github.com/syed/erlcscope.git
pkgname=erlcscope
pkgver=1.0.0
pkgrel=1
pkgdesc="Program which builds cscope database for erlang files"
arch=('any')
url="https://github.com/syed/erlcscope.git"
license=('custom')
groups=()
depends=()
makedepends=()
provides=()
conflicts=('erlcscope-git')
replaces=()
backup=()
options=()
install=
source=('https://github.com/syed/erlcscope/archive/v1.0.0.tar.gz')
noextract=()
md5sums=('3efb9e80e96a9257f888224c5d9392d2') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  #
  # BUILD HERE
  #
  make clean
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  if [ ! -d $pkgdir/usr/bin ]; then
    mkdir -p $pkgdir/usr/bin
  fi
  make DEST_BIN="$pkgdir/usr/bin" install
  if [ ! -f $pkgdir/usr/share/licenses/erlcscope/LICENSE ]; then
    mkdir -p $pkgdir/usr/share/licenses/erlcscope/
    cp LICENSE $pkgdir/usr/share/licenses/erlcscope/
  fi
}

# vim:set ts=2 sw=2 et:
