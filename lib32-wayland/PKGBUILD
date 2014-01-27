# Maintainer: oxalin <alexandre.f.demers@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
_pkgbase=wayland
pkgname=lib32-$_pkgbase
pkgver=1.4.0
pkgrel=1
pkgdesc='A computer display server protocol (32 bit)'
arch=('x86_64')
url='http://wayland.freedesktop.org'
license=('MIT')
depends=('lib32-libffi' "$_pkgbase")
makedepends=('gcc-multilib' 'lib32-expat')
options=(!libtool)
source=("http://wayland.freedesktop.org/releases/$_pkgbase-$pkgver.tar.xz")
sha1sums=('bc91befb8386ec5c1ff4f24ad8464c24a7496ae2')

build() {  
  export CC="gcc -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --disable-static --libdir=/usr/lib32 --disable-documentation
  make
}

package() {
  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{bin,include,share}

  install -dm755 "$pkgdir"/usr/share/licenses
  ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et: