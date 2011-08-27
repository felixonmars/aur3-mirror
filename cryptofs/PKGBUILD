# Maintainer: Gaetan Bisson <gaetan.bisson@loria.fr>

pkgname=cryptofs
pkgver=0.6.0
pkgrel=1
pkgdesc='Encrypted filesystem for FUSE and LUFS'
arch=('i686' 'x86_64')
url='http://reboot78.re.funpic.de/cryptofs/'
license=('GPL')
depends=('fuse' 'libgcrypt' 'glib2')
source=("${url}cryptofs-$pkgver.tar.gz")
sha1sums=('233717189ed2e0d478b6d4e27b99d355b7df34fa')

install=install

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-pinentry=no
  make || return 1
  make DESTDIR="$pkgdir" install

  mkdir -p "$pkgdir/usr/share/doc/cryptofs"
  install -m 644 cryptofs.conf README "$pkgdir/usr/share/doc/cryptofs"
}
