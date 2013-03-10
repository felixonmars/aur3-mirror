# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=unity-lens-shopping
pkgver=6.8.0
pkgrel=2
pkgdesc="Gives you more suggestions when searching Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-lens-shopping"
license=('GPL')
depends=('libsoup-gnome' 'json-glib' 'libunity')
makedepends=('vala' 'intltool')
source=(http://launchpad.net/$pkgname/6.0/$pkgver/+download/$pkgname-$pkgver.tar.gz
        http://pkgbuild.com/~bgyorgy/sources/$pkgname-translations-20130310.tar.gz)
md5sums=('b87e595ba1d92419b4ae8a2d29bd14cd'
         '8794d31a3bf553bc93a5e8486e721c34')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install updated language files
  rename $pkgname- '' ../po/$pkgname-*.po
  mv -f -t po ../po/*
  printf "%s\n" po/*.po | sed -e 's/po\///g' -e 's/\.po//g' >po/LINGUAS

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
