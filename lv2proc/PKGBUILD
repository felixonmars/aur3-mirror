# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=lv2proc
pkgver=0.5.0
pkgrel=1
pkgdesc="A simple command line effect processor using LV2 plugins."
arch=('i686' 'x86_64')
url="http://naspro.sourceforge.net/"
license=('GPL3')
depends=('lilv')
source=("http://download.sourceforge.net/project/naspro/naspro/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('a0fdc0d70715dff0be69f76295292b08')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # DSO link fix for libm
  LDFLAGS+="-lm" \
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
