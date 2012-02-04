# Maintainer: Christopher Rosell <chrippa@tanuki.se>

# aur split package hacks
pkgname='upse'
true && pkgname=(libupse upse123)

pkgbase='upse'
pkgver=1.9.1
pkgrel=1
pkgdesc='UPSE is an advanced playstation sound emulator which concentrates on sound correctness'
arch=('i686' 'x86_64')
url='http://nenolod.net/projects/upse/'
license=('GPL')
makedepends=(libao)
source=("http://hg.atheme.org/unofficial/upse/archive/$pkgbase-$pkgver.tar.bz2"
        'makefile-fix.patch')
md5sums=('fdd65d4f2a7c98f1399d2c949366d82b'
         'c839a257ec0c7d8a3ff1e74abe18b7cf')


build() {
  msg "Starting build..."

  cd "$srcdir/$pkgbase-$pkgbase-$pkgver"

  patch -p1 < "$startdir/makefile-fix.patch"
  ./autogen.sh
  ./configure --prefix=/usr --disable-audplugin --enable-ao
  make
}

package_libupse() {
  provides=(libupse)
  depends=(zlib)

  cd "$srcdir/$pkgbase-$pkgbase-$pkgver/src/libupse"
  make DESTDIR="$pkgdir/" install
}

package_upse123() {
  depends=(libupse libao)
  provides=(upse123)

  cd "$srcdir/$pkgbase-$pkgbase-$pkgver/src/upse123"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
