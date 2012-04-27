# Contributor: mar77i <mysatyre@gmail.com>

pkgname=uae
pkgver=0.8.29
pkgrel=4
pkgdesc="The Ubiquitous Amiga Emulator."
url="http://uae.coresystems.de/"
license="GPL"
arch=(i686 x86_64)
conflicts=(e-uae)
depends=('gtk2>=2.0.0' 'sdl' 'alsa-lib')
makedepends=('zlib')
source=("http://www.amigaemulator.org/files/sources/develop/$pkgname-$pkgver.tar.bz2"
        "uae.desktop" "uae.png")
md5sums=('54abbabb5e8580b679c52de019141d61'
         '89235b4e1a55bed894c26e942fab38f7'
         'c5c27437c50ece7ce6ab027a49a16de8')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  ./configure --enable-bsdsock --enable-scsi-device \
  --with-sdl --with-sdl-gfx --with-sdl-gl \
  --with-alsa --prefix=/usr
  sed -ri 's/^(LIBRARIES = .*)$/\1 -lm/1' src/Makefile
  # DGA / XF86VidMode incompatible w/ SDL
  # Uncomment dga/vidmode & comment out sdl to use.
  #--enable-dga --enable-vidmode
  make
  make prefix="$pkgdir/usr" install
  install -Dm644 "$startdir/uae.desktop" "$pkgdir/usr/share/applications/uae.desktop"
  install -Dm644 "$startdir/uae.png" "$pkgdir/usr/share/uae/uae.png"
}
