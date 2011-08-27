# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Adam Vogt <vogt.adam@gmail.com>
pkgname=freepv
pkgver=0.3.0
pkgrel=2
pkgdesc="A panorama viewer"
arch=('i686' 'x86_64')
url="http://freepv.sourceforge.net/"
license=('LGPL')
depends=('freeglut' 'libxml2' 'libjpeg' 'libpng')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        disable_plugin.diff build_fix.diff)
md5sums=('8a77f721838d22accd86d40b1580c408'
         '20dbfa57aa06e6a3be79bf173e734de5'
         '3e2693a2e20898c0ec06b1380689c4ea')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 < "$srcdir/disable_plugin.diff"
  patch -Np1 < "$srcdir/build_fix.diff"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
