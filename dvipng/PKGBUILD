# Contributor: scippio <scippio@berounet.cz>

pkgname="dvipng"
pkgver="1.14"
pkgrel="1"
pkgdesc="Convert PNG and/or GIF files to DVI."
url="http://dvipng.sourceforge.net"
license=("LGPL")
arch=("i686" "x86_64")
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('55779894dff0a6ec4e51404b977ee6e8')
depends=('gd>=2.0.28' 'texlive-bin' 'freetype2>=2.1.9' 't1lib' 'libpng' 'zlib' 'texinfo')
# kpathsea
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure
  make || return 1
  make DESTDIR="$pkgdir" install
}
