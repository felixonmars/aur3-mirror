# Maintainer: 404
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Heine Laursen <zannvip at gmail dot com>
# Contributor: Tucos <baspape@gmail.com>
# Contributor: Jelle van der Waa <jellevdwaa  @ [the google mail .com]>

pkgname=techne
pkgver=0.2.3
pkgrel=2
pkgdesc="A general purpose, programmable physical simulator and renderer"
arch=('x86_64' 'i686')
url="http://savannah.nongnu.org/projects/techne/"
license=('GPL3')
depends=('lua51' 'gtkglext' 'libwebkit' 'libmicrohttpd' 'openal' 'imagemagick' 'ode-compat' 'plplot')
makedepends=('gcc-objc')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9fbe50271929fa2aad7235baf9df93a9')

build() {
  cd $pkgname-$pkgver

  # uncomment the following lines, if the linker has problems finding lua
  #LUA_CFLAGS="$(pkg-config --cflags lua5.1)" \
  #LUA_LIBS="$(pkg-config --libs lua5.1)" \
  #LUAC=/usr/bin/luac5.1 \
  ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
