# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares-git
_pkgname=c-ares
pkgver=1.10.0.r13.gd5d3871
pkgrel=1
pkgdesc='C library that performs DNS requests and name resolves asynchronously'
arch=('i686' 'x86_64')
url='http://c-ares.haxx.se/'
license=('custom')
depends=('glibc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/bagder/c-ares.git"
        'LICENSE')
sha256sums=('SKIP'
            '8f7ef984b727cac428431406e5f4b1f66a34abc177f5caee6b22471b95c5a161')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long | cut -d '-' -f2- | sed 's/-/.r/;s/[-_]/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  autoreconf -fiv

  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-shared

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
