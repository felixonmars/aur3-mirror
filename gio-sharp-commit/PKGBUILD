# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Benjamin Mtz (cruznick) <cruznick at archlinux dot us>
pkgname=gio-sharp-commit
pkgver=99cdb9c4bad171b6f987
pkgrel=1
pkgdesc="a branch of the official gtk-sharp/gio to get gio-sharp building on gtk-sharp 2.12(last working commit for docky)"
url="http://github.com/mono/gio-sharp"
arch=(i686 x86_64)
license=(custom)
depends=(gtk-sharp-2)
makedepends=(git pkgconfig autoconf)
conflicts=('gio-sharp' 'gio-sharp-git')
options=(!libtool)
provides=('gio-sharp' 'gio-sharp-git')
source=( https://github.com/mono/gio-sharp/tarball/99cdb9c4bad171b6f987a3969112dbcd986bd0bd )
md5sums=(2fc75502f3cd9bfb03137576b167c071)
_realname=mono-gio-sharp-99cdb9c

build() {
cd "$srcdir/$_realname"
  msg2 "Starting build..."

  ./autogen-2.22.sh --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$_realname"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  provides=("gio-sharp=$(grep '^PACKAGE_VERSION=' configure | awk -F\' '{print $2}')")
}
