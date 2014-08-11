# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=libxml
pkgver=1.8.17
pkgrel=7
pkgdesc="The XML C parser and toolkit of Gnome. Older version"
arch=(i686 x86_64)
url="http://xmlsoft.org/"
license=('GPL')
depends=('zlib')
source=("ftp://xmlsoft.org/libxml2/old/$pkgname-$pkgver.tar.gz")
md5sums=('53846294aa850a7d042948176d1d19dc')

prepare() {
  cd $pkgname-$pkgver
  # build with -D_FORTIFY_SOURCE=2
  sed -i "s|\(O_WRONLY\))|\1, 0666)|" nanohttp.c
}

build() {
  cd $pkgname-$pkgver
  CPP=cpp CPPFLAGS= \
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
