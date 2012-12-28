# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=ruby-rcairo
pkgver=1.10.0
pkgrel=2
pkgdesc="Ruby bindings for cairo"
arch=('i686' 'x86_64')
url="http://www.cairographics.org/rcairo/"
license=('RUBY')
depends=('cairo' 'ruby')
makedepends=('ruby-pkgconfig')
source=(http://cairographics.org/releases/${pkgname/*-}-$pkgver.tar.gz)
md5sums=('4fe76f1069d0d1ccfdf7848e3e928d9f')

build() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  ruby extconf.rb
  make
}

package() {
  cd "$srcdir/${pkgname/*-}-$pkgver"
  make DESTDIR="$pkgdir" install
}
