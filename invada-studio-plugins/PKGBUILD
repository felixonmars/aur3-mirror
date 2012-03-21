# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=invada-studio-plugins
pkgver=0.3.1
pkgrel=2
pkgdesc="A set of LADSPA audio effect plugins, ported from VST."
arch=('i686' 'x86_64')
url="https://launchpad.net/invada-studio/"
license=('GPL2')
groups=('ladspa-plugins')
depends=('glibc')
makedepends=('ladspa')
source=("${url}ladspa/${pkgver%.*}/+download/${pkgname}_${pkgver}-1.tar.gz")
md5sums=('d72241f84deff5aebe13c8ff102d7b04')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # destdir fix
  sed -i "s|usr/local|$pkgdir/usr|" Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
}
