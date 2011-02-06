# Contributor: Jaroslav Lichtblau (Dragonlord) <dragonlord@aur.archlinux.org>

pkgname=somaplayer
pkgver=0.5.3
pkgrel=2
pkgdesc="Player for radio streaming/econding/mixing."
arch=('i686')
url="http://www.somasuite.org/"
license=('GPL')
depends=('libao' 'libsndfile' 'lame' 'gtk2' 'libid3tag' 'cdparanoia' 'libmad' 'libvorbis' 'openssl')
options=(!libtool)
source=(http://www.somasuite.org/src/$pkgname-$pkgver.tar.gz)

md5sums=('9e5f148589af1fdd308ebd87b4562778')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --mandir=/usr/share/man
  make || return 1
  make DESTDIR=$pkgdir install

  install -D -m644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
