# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=lib32-xcb-util-image
pkgver=0.3.9
pkgrel=1
pkgdesc="Utility libraries for XC Binding - Port of Xlib's XImage and XShmImage functions"
arch=('i686' 'x86_64')
url="http://xcb.freedesktop.org"
license=('custom')
depends=('lib32-xcb-util')
makedepends=('gcc-multilib' 'xorg-util-macros')
options=('!libtool')
source=("$url/dist/xcb-util-image-$pkgver.tar.bz2" LICENSE)
sha256sums=('d35a3c0eaae171f5081ec127fb9cec174b716ce5d78196a87f2785376da021df'
            'ded299aa179dcf0d885bf89274a4db77a530e03f9f5e7cf1c3c4ef1d60e914b9')

build() {
  cd xcb-util-image-$pkgver

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-static=no
  make
}

package() { 
  cd xcb-util-image-$pkgver/image
  make DESTDIR="$pkgdir" install-{libLTLIBRARIES,pkgconfigDATA}

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
