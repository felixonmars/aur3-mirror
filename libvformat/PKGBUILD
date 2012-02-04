# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
pkgname=libvformat
pkgver=1.13
pkgrel=1
pkgdesc="A library for reading and writing vcard files."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vformat/"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/vformat/files/vformat/Alpha-6-Linux/$pkgname-$pkgver-a6r3.tar.gz" "libvformat-nodoc.patch")
noextract=()
sha256sums=('ad50ea326daeaccac59716208f6eac23691d3e4af906a8915f62078c49fcad74'
            '844d768048b58ca95818619b4a86d615a6a7e010d28524a05a1255961d283670')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p0 < ../libvformat-nodoc.patch
  
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  
  install -m644 "$srcdir/$pkgname-$pkgver/common/types.h" "$pkgdir/usr/include/vf_types.h"
  sed -i 's/common\/types.h/vf_types.h/' "$pkgdir/usr/include/vf_iface.h"
}

# vim:set ts=2 sw=2 et:


