# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: masutu <masutu dot arch at googlemail dot com>

pkgname=miniaudicle
pkgver=1.3.0a
pkgrel=1
pkgdesc="A lightweight IDE for the ChucK digital audio programming language"
arch=('i686' 'x86_64')
url="http://audicle.cs.princeton.edu/mini/"
license=('GPL')
depends=('jack' 'qscintilla')
optdepends=('chugins-git: chuck extensions')
provides=('chuck')
if [[ "$CARCH" = 'x86_64' ]]; then
  provides+=('bin32-chuck' 'bin32-miniaudicle')
  conflicts=(${provides[@]:2})
  replaces=(${provides[@]:1})
fi
source=("${url}release/files/miniAudicle-$pkgver.tgz")
md5sums=('a38487f9033dc2b0719bf84e74ed76f9')

prepare() {
  cd miniAudicle-$pkgver/src
  # missing ulib_regex.o while linking
  sed -i '/ulib_opsc.o/{p;s/opsc.*/regex.o \\/}' makefile.jack
}

build() {
  cd miniAudicle-$pkgver/src
  make makefile.qt-jack
  make -f makefile.qt-jack
}

package() {
  cd miniAudicle-$pkgver/src
  install -Dm755 miniAudicle "$pkgdir/usr/bin/miniaudicle"
}
