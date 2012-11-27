# Maintainer: Phillip Wood <phillip.wood@dunelm.org.uk>
pkgname='drwright'
pkgver=3.6.0
_downloadver=3.5.0
pkgrel=1
epoch=0
pkgdesc="Typing break for GNOME3 aka gnome-typing-monitor (used to be part of gnome-control-center in GNOME2)"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/drwright"
license=('GPL')
depends=('gnome-control-center' 'libxss')
makedepends=('intltool')
install="$pkgname.install"
source=("ftp://ftp.gnome.org/pub/gnome/sources/drwright/3.5/$pkgname-$_downloadver.tar.xz"
        "drwright.install"
        "3.6.0.patch")
sha256sums=('a8b64b27fdf0aa8c6703141a0e83e2619e34b8d1303afdeef304761814bcfbb8'
            'b9f8bdaa058b458951112febd3210674a78cf8cbd1fa48ef6b166ccd55603da8'
            'a7bffc607a170b6c5b50db72fbda66aff5446e9ff4dc187b7fece86f87e3c056')

build() {
  cd "$srcdir/$pkgname-$_downloadver"
  patch -p1 < $srcdir/3.6.0.patch
./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
      --disable-static --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$_downloadver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
