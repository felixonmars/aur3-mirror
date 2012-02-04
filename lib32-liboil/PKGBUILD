# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: TryA <tryagainprod {at} gmail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>
# Contributor: mightyjaym <jm.ambrosino@free.fr>

_pkg=liboil
pkgname=lib32-$_pkg
pkgver=0.3.17
pkgrel=3
pkgdesc="Library of simple functions that are optimized for various CPUs. Multilib."
arch=('x86_64')
license=('custom')
url="http://liboil.freedesktop.org/"
depends=("$_pkg" 'lib32-glibc')
makedepends=('gcc-multilib' 'lib32-glib2' 'pkgconfig')
options=('!libtool' '!makeflags')
source=("${url}download/$_pkg-$pkgver.tar.gz")
md5sums=('47dc734f82faeb2964d97771cfd2e701')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  export CC='gcc -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  unset CFLAGS

  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-static=no \
              --disable-gtk-doc \
              --build=i686-unknown-linux-gnu

  # Disable doc and samples
  sed -i "s|\(SUBDIRS = liboil\).*|\1|" Makefile

  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install

  # Remove headers
  rm -rf "$pkgdir/usr/include"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s /usr/share/licenses/$_pkg/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname"
}
