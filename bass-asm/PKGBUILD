# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Themaister <maister@archlinux.us>

pkgname=bass-asm
pkgver=13
pkgrel=1
pkgdesc="BASS is a multi-target cross assembler for SNES 65c816 and SPC-700 architectures."
arch=('i686' 'x86_64')
url="http://byuu.org/"
license=('GPL3')
depends=('gcc-libs')
source=("http://byuu.org/files/bass_v$pkgver.tar.xz")
sha256sums=('948ff7f45515e7742bc281e6fcc4553a4e963c7e92090dc1445e1cc4e227d835')

prepare() {
  sed -e 's/g++-4.7/g++/g' \
      -e '/cflags/ s/=/= $(CPPFLAGS) $(CFLAGS)/' \
      -e '/cppflags/ s/=/= $(CPPFLAGS) $(CXXFLAGS)/' \
      -e '49 s/$/ $(LDFLAGS)/' \
      -i "$srcdir/nall/Makefile"
}

build() {
  cd "$srcdir/bass"
  make
}

package() {
   install -Dm755 "$srcdir/bass/bass" "$pkgdir/usr/bin/bass"
   install -Dm644 "$srcdir/bass/doc/bass.html" "$pkgdir/usr/share/doc/bass.html"
}
