# Maintainer: speps <speps dot aur dot archlinux dot org>

pkgname=ngjackspa
pkgver=1.0
pkgrel=1
pkgdesc="Simple LADSPA hosts for JACK"
arch=('i686' 'x86_64')
url="https://gna.org/projects/ngjackspa"
license=('GPL')
depends=('jack')
makedepends=('gtkmm' 'qt4')
optdepends=('gtkmm: GTK ui'
            'qt4: Qt4 ui')
source=("http://download.gna.org/ngjackspa/$pkgname-$pkgver.tar.gz")
md5sums=('dd058a35e1355b483a10e9a33abed53f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # use qmake-qt4
  sed -i 's/QMAKE = qmake/&-qt4/' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install install-doc
}
